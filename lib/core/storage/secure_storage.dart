import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../network/api_service.dart';

class _Keys {
  static const access = 'access';
  static const refresh = 'refresh';
  static const user = 'user';
  static const type = 'type';
}

class SecureStorage implements AuthTokenStore {
  final _store = const FlutterSecureStorage();
  final _forceLogoutController = StreamController<void>.broadcast();
  Stream<void> get onForceLogout => _forceLogoutController.stream;

  @override
  Future<String?> get access => _store.read(key: _Keys.access);

  @override
  Future<String?> get refresh => _store.read(key: _Keys.refresh);

  Future<String?> get userJson => _store.read(key: _Keys.user);

  Future<String?> get userType => _store.read(key: _Keys.type);

  @override
  Future<void> updateTokens(String access, String refresh) async {
    await _store.write(key: _Keys.access, value: access);
    await _store.write(key: _Keys.refresh, value: refresh);
  }

  Future<void> saveUser(String userJsonString) =>
      _store.write(key: _Keys.user, value: userJsonString);

  Future<void> saveSession({
    required String access,
    required String refresh,
    required String userJson,
    required String userType,
  }) async {
    await _store.write(key: _Keys.access, value: access);
    await _store.write(key: _Keys.refresh, value: refresh);
    await _store.write(key: _Keys.user, value: userJson);
    await _store.write(key: _Keys.type, value: userType);
  }

  @override
  Future<void> clearSession() async {
    await _store.deleteAll();
    _forceLogoutController.add(null);
  }
}
