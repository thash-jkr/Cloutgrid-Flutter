import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'api_config.dart';
import 'api_error.dart';

abstract class AuthTokenStore {
  Future<String?> get access;
  Future<String?> get refresh;
  Future<void> updateTokens(String access, String refresh);
  Future<void> clearSession();
}

const _requireAuthKey = 'requireAuth';

const _isRefreshRequestKey = 'isRefreshRequest';

class ApiService {
  final AuthTokenStore _authStore;
  final String baseUrl = ApiConfig.current.baseUrl;

  late final Dio client;

  ApiService(this._authStore) {
    client = Dio(BaseOptions(baseUrl: baseUrl));
    client.interceptors.add(_AuthInterceptor(client, _authStore, baseUrl));
  }

  Future<T> request<T>(
    String endpoint, {
    required String method,
    required T Function(dynamic json) fromJson,
    Object? body,
    required bool requireAuth,
    bool fullUrl = false,
  }) async {
    final urlString = fullUrl ? endpoint : '$baseUrl$endpoint';

    late Response response;
    try {
      response = await client.request(
        urlString,
        options: Options(
          method: method,
          contentType: body != null ? 'application/json' : null,
          extra: {_requireAuthKey: requireAuth},
        ),
        data: body,
      );
    } on DioException catch (e) {
      if (e.error is ApiError) throw e.error as ApiError;

      final response = e.response;
      if (response != null) {
        final data = response.data;
        final serverMessage = (data is Map && data['message'] != null)
            ? data['message'].toString()
            : 'An error occurred status code: ${response.statusCode}';
        throw ServerError(serverMessage);
      }

      throw const ServerError('Network connection failed');
    }

    if (response.statusCode == 204) {
      return fromJson(null);
    }

    try {
      return fromJson(response.data);
    } catch (_) {
      throw const DecodingError('Failed to decode response mapping.');
    }
  }

  Future<T> multipartRequest<T>(
    String endpoint, {
    required String method,
    required T Function(dynamic json) fromJson,
    Uint8List? imageBytes,
    String? imageKey,
    required Map<String, String> params,
    required bool requireAuth,
  }) async {
    final formMap = <String, dynamic>{...params};
    if (imageBytes != null && imageKey != null) {
      formMap[imageKey] = MultipartFile.fromBytes(
        imageBytes,
        filename: 'profile.jpg',
        contentType: DioMediaType('image', 'jpeg'),
      );
    }

    late Response response;
    try {
      response = await client.request(
        '$baseUrl$endpoint',
        data: FormData.fromMap(formMap),
        options: Options(method: method, extra: {_requireAuthKey: requireAuth}),
      );
    } on DioException catch (e) {
      if (e.error is ApiError) throw e.error as ApiError;

      final response = e.response;
      if (response != null) {
        final data = response.data;
        final serverMessage = (data is Map && data['message'] != null)
            ? data['message'].toString()
            : 'An error occurred status code: ${response.statusCode}';
        throw ServerError(serverMessage);
      }

      throw ServerError(e.message ?? 'Network upload failed');
    }

    try {
      return fromJson(response.data);
    } catch (_) {
      throw const DecodingError('Failed to decode response mapping.');
    }
  }
}

class _AuthInterceptor extends Interceptor {
  final Dio _client;
  final AuthTokenStore _authStore;
  final String _baseUrl;

  _AuthInterceptor(this._client, this._authStore, this._baseUrl);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requireAuth = options.extra[_requireAuthKey] as bool? ?? true;
    if (requireAuth) {
      final access = await _authStore.access;
      if (access != null && access.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $access';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final isRefreshRequest =
        err.requestOptions.extra[_isRefreshRequestKey] as bool? ?? false;

    if (err.response?.statusCode != 401 || isRefreshRequest) {
      return handler.next(err);
    }

    final refreshToken = await _authStore.refresh;

    if (refreshToken == null) {
      await _authStore.clearSession(); // ADD THIS
      return handler.next(err);
    }

    try {
      final refreshResponse = await _client.post(
        '$_baseUrl/token/refresh/',
        data: {'refresh': refreshToken},
        options: Options(extra: {_isRefreshRequestKey: true}),
      );

      final newAccess = refreshResponse.data['access'] as String? ?? '';
      final newRefresh =
          refreshResponse.data['refresh'] as String? ?? refreshToken;

      await _authStore.updateTokens(newAccess, newRefresh);

      final retryOptions = err.requestOptions;
      retryOptions.headers['Authorization'] = 'Bearer $newAccess';
      final retryResponse = await _client.fetch(retryOptions);
      return handler.resolve(retryResponse);
    } catch (_) {
      await _authStore.clearSession();
      return handler.next(err);
    }
  }
}
