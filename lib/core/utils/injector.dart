import 'dart:async';
import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import '/core/consts/app_consts.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api/login/login_api.dart';
import '../../data/api/login/login_api_impl.dart';
import '../../data/api/logout/logout_api.dart';
import '../../data/api/logout/logout_api_impl.dart';
import '../../domain/repositories/auth/auth_repository.dart';
import '../../domain/repositories/auth/auth_repository_impl.dart';
import '../../domain/repositories/login/login_repository.dart';
import '../../domain/repositories/login/login_repository_impl.dart';
import '../../domain/repositories/logout/logout_repository.dart';
import '../../domain/repositories/logout/logout_repository_impl.dart';
import '../../domain/usecase/login/login_use_case.dart';
import '../../domain/usecase/logout/logout_request_use_case.dart';
import '../../infrastructure/network/laf_api_client.dart';
import '../../infrastructure/storage/laf_Key_value_store.dart';
import '../../infrastructure/storage/laf_key_value_store_impl.dart';
import 'laf_platform.dart';

typedef AppRunner = FutureOr<void> Function();

class Injector {
  static Future<void> init({
    required AppRunner appRunner,
  }) async {
    Fimber.plantTree(DebugTree(useColors: true));

    /// Sets the URL strategy for when running the app on Flutter Web
    Routemaster.setPathUrlStrategy();

    await _initDependencies();
    appRunner();
  }

  static Future<void> _initDependencies() async {
    await _injectUtils();
    _injectRepositories();
    await _injectServices();
    _injectUseCase();
    _injectApi();
    await GetIt.I.allReady();
  }
}

FutureOr<void> _injectUtils() async {
  GetIt.I.registerLazySingleton<LAFPlatform>(() => LAFPlatform());
  GetIt.I.registerLazySingleton<Dio>(() => Dio());
  GetIt.I.registerLazySingleton<FirebaseMessaging>(
      () => FirebaseMessaging.instance);
  GetIt.I.registerLazySingleton<LafApiClient>(
      () => LafApiClient(GetIt.I<Dio>(), AppConsts.baseURL));
  GetIt.I.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  GetIt.I.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());
  GetIt.I.registerLazySingleton<LafKeyValueStore>(
      () => LafKeyValueStoreImpl(GetIt.I<SharedPreferences>()));
  GetIt.I.registerLazySingleton<ImagePicker>(() => ImagePicker());
}

/// Register all repository implementations.
///
/// Please ensure modifications are kept in alphabetical order (where possible) to ensure legibility.
void _injectRepositories() {
  GetIt.I.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  GetIt.I.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  GetIt.I.registerLazySingleton<LogoutRepository>(() => LogoutRepositoryImpl());
}

void _injectUseCase() {
  GetIt.I
      .registerLazySingleton<LoginRequestUseCase>(() => LoginRequestUseCase());
  GetIt.I.registerLazySingleton<LogoutRequestUseCase>(
      () => LogoutRequestUseCase());
}

void _injectApi() {
  GetIt.I.registerLazySingleton<LoginApi>(() => LoginApiImpl());
  GetIt.I.registerLazySingleton<LogoutApi>(() => LogoutApiImpl());
}

/// Register all service-related implementations.
///
/// Please ensure modifications are kept in alphabetical order (where possible) to ensure legibility.
Future<void> _injectServices() async {
}
