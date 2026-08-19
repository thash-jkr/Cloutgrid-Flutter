import 'dart:convert';
import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/network/api_service.dart';
import '../../core/providers/core_providers.dart';
import '../../core/storage/secure_storage.dart';
import '../../models/auth_state.dart';
import '../../models/auth/auth_models.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  ApiService get _api => ref.read(apiServiceProvider);
  SecureStorage get _storage => ref.read(secureStorageProvider);

  @override
  Future<AuthState> build() async {
    ref.listen(secureStorageForceLogoutProvider, (_, _) {
      state = const AsyncValue.data(AuthState.unauthenticated);
    });

    final access = await _storage.access;
    final userJsonString = await _storage.userJson;
    final userType = await _storage.userType;

    final user = userJsonString != null
        ? UserContainer.fromJson(jsonDecode(userJsonString))
        : null;

    return AuthState(
      isAuth: access != null && access.isNotEmpty,
      user: user,
      type: userType,
      access: access,
    );
  }

  void _setLoading(bool loading, {bool clearError = false}) {
    final current = state.value;
    if (current == null) {
      return;
    }
    state = AsyncValue.data(
      current.copyWith(isLoading: loading, clearErrorMessage: clearError),
    );
  }

  void _setError(String message) {
    final current = state.value;
    if (current == null) return;
    state = AsyncValue.data(
      current.copyWith(isLoading: false, errorMessage: message),
    );
  }

  Future<void> login(String email, String password, String userType) async {
    _setLoading(true, clearError: true);
    try {
      final response = await _api.request<LoginResponse>(
        '/login/$userType/',
        method: 'POST',
        fromJson: (json) => LoginResponse.fromJson(json),
        body: {'email': email, 'password': password},
        requireAuth: false,
      );

      await _saveSession(response, userType);
    } catch (e) {
      _setError(e.toString());
      rethrow;
    }
  }

  Future<void> logout() async {
    _setLoading(true, clearError: true);
    final refreshToken = await _storage.refresh ?? '';

    try {
      await _api.request<dynamic>(
        '/logout/',
        method: 'POST',
        fromJson: (json) => json,
        body: {'refresh': refreshToken},
        requireAuth: true,
      );
    } catch (_) {
    } finally {
      await clearSession();
    }
  }

  Future<void> _saveSession(LoginResponse response, String userType) async {
    final userJsonString = jsonEncode(response.user.toJson());

    await _storage.saveSession(
      access: response.access,
      refresh: response.refresh,
      userJson: userJsonString,
      userType: userType,
    );

    state = AsyncValue.data(
      AuthState(isAuth: true, user: response.user, type: userType),
    );
  }

  Future<void> clearSession() async {
    await _storage.clearSession();
    state = const AsyncValue.data(AuthState.unauthenticated);
  }

  Future<void> updateProfile({
    required String userType,
    required Map<String, String> data,
    Uint8List? imageBytes,
  }) async {
    _setLoading(true, clearError: true);
    try {
      final updatedUser = await _api.multipartRequest<UserContainer>(
        '/profile/$userType/',
        method: 'PUT',
        fromJson: (json) => UserContainer.fromJson(json),
        imageBytes: imageBytes,
        imageKey: 'user[profile_photo]',
        params: data,
        requireAuth: true,
      );

      await saveUser(updatedUser);
      _setLoading(false);
    } catch (e) {
      _setError(e.toString());
      rethrow;
    }
  }

  Future<void> saveUser(UserContainer user) async {
    await _storage.saveUser(jsonEncode(user.toJson()));
    final current = state.value;
    state = AsyncValue.data(
      (current ?? AuthState.unauthenticated).copyWith(user: user, isAuth: true),
    );
  }

  Future<void> setInstagramConnected(bool connected) async {
    final currentUser = state.value?.user;
    if (currentUser == null) return;
    await saveUser(currentUser.copyWith(instagramConnected: connected));
  }

  Future<void> setYoutubeConnected(bool connected) async {
    final currentUser = state.value?.user;
    if (currentUser == null) return;
    await saveUser(currentUser.copyWith(youtubeConnected: connected));
  }

  Future<void> register(Map<String, String> data, String type) async {
    _setLoading(true, clearError: true);

    try {
      await _api.multipartRequest<dynamic>(
        '/register/$type/',
        method: 'POST',
        fromJson: (json) => json,
        imageBytes: null,
        imageKey: null,
        params: data,
        requireAuth: false,
      );
      _setLoading(false);
    } catch (e) {
      _setError(e.toString());
      rethrow;
    }
  }

  Future<void> handleOTP(Map<String, String> data, String type) async {
    _setLoading(true, clearError: true);

    try {
      await _api.multipartRequest<dynamic>(
        '/otp/$type/',
        method: 'POST',
        fromJson: (json) => json,
        imageBytes: null,
        imageKey: null,
        params: data,
        requireAuth: false,
      );
      _setLoading(false);
    } catch (e) {
      _setError(e.toString());
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    _setLoading(true, clearError: true);

    try {
      await _api.request<dynamic>(
        '/password-reset/',
        method: 'POST',
        fromJson: (json) => json,
        body: {'email': email},
        requireAuth: false,
      );
      _setLoading(false);
    } catch (e) {
      _setError(e.toString());
      rethrow;
    }
  }

  Future<void> deleteAccount(String type) async {
    _setLoading(true, clearError: true);

    try {
      await _api.request<dynamic>(
        '/delete/$type/',
        method: 'DELETE',
        fromJson: (json) => json,
        requireAuth: true,
      );
      await clearSession();
    } catch (e) {
      _setError(e.toString());
      rethrow;
    }
  }
}
