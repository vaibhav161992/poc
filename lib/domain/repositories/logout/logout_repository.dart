import 'dart:async';

import '../../../data/entities/logout/logout_response_entities.dart';

abstract class LogoutRepository {
  FutureOr<LogoutResponseEntity> logoutRequest({required String fcmToken});
}
