import 'dart:async';
import 'package:get_it/get_it.dart';

import '../../../data/api/login/login_api.dart';
import '../../../data/entities/login/login_response_entity.dart';
import 'login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final loginApi = GetIt.I<LoginApi>();

  @override
  FutureOr<LoginResponseEntity?> loginRequest({
    required String username,
    required String password,
    required String fcmToken,
  }) {
    return loginApi.loginRequest(
        username: username, password: password, fcmToken: fcmToken);
  }
}
