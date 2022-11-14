import 'dart:async';

import '/data/entities/logout/logout_response_entities.dart';

abstract class LogoutApi {
  FutureOr<LogoutResponseEntity> logoutRequest({
    required String fcmToken,
  });
}
