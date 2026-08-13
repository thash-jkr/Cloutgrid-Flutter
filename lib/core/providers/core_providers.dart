import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../network/api_service.dart';
import '../storage/secure_storage.dart';

part 'core_providers.g.dart';

@Riverpod(keepAlive: true)
SecureStorage secureStorage(Ref ref) => SecureStorage();

@Riverpod(keepAlive: true)
ApiService apiService(Ref ref) {
  return ApiService(ref.watch(secureStorageProvider));
}

@riverpod
Stream<void> secureStorageForceLogout(Ref ref) {
  return ref.watch(secureStorageProvider).onForceLogout;
}
