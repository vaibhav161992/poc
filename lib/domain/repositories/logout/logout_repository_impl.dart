import 'dart:async';
import 'package:get_it/get_it.dart';

import '../../../data/api/logout/logout_api.dart';
import '../../../data/entities/logout/logout_response_entities.dart';
import 'logout_repository.dart';

class LogoutRepositoryImpl extends LogoutRepository {
  final logoutApi = GetIt.I<LogoutApi>();

  @override
  FutureOr<LogoutResponseEntity> logoutRequest({required String fcmToken}) {
    return logoutApi.logoutRequest(fcmToken: fcmToken);
  }
}
