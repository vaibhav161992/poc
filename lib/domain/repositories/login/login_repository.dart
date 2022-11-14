import 'dart:async';

import '../../../data/entities/login/login_response_entity.dart';

abstract class LoginRepository {
  FutureOr<LoginResponseEntity?> loginRequest({
    required String username,
    required String password,
    required String fcmToken,
  });
}
