import 'dart:async';
import 'package:get_it/get_it.dart';

import '../../../core/consts/storage_keys.dart';
import '../../../infrastructure/storage/laf_Key_value_store.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _sharedPrefKeyStore = GetIt.I<LafKeyValueStore>();

  @override
  FutureOr<bool?> hasCompleteLogin() =>
      _sharedPrefKeyStore.read(StorageKeys.hasLoggedIn);


  @override
  FutureOr<void> completeLogin(
      {required String? token,
        required String? userName,
      required String? userEmail}) {
    _sharedPrefKeyStore.write(StorageKeys.hasLoggedIn, true);
    _sharedPrefKeyStore.write(StorageKeys.token, token);
    _sharedPrefKeyStore.write(StorageKeys.userName, userName);
    _sharedPrefKeyStore.write(StorageKeys.userEmail, userEmail);
  }

  @override
  FutureOr<String?> getToken() => _sharedPrefKeyStore.read(StorageKeys.token);

  @override
  FutureOr<void> hasLogout() {
    _sharedPrefKeyStore.deleteAll();
  }
}
