import 'dart:async';

import '../../entities/login/login_response_entity.dart';

abstract class LoginApi {
  FutureOr<LoginResponseEntity> loginRequest({
    required String username,
    required String password,
    required String fcmToken,
  });
}
