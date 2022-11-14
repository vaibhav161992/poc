import 'dart:async';
import 'package:get_it/get_it.dart';

import '../../../data/entities/logout/logout_response_entities.dart';
import '../../model/logout_response_model.dart';
import '../../repositories/logout/logout_repository.dart';

class LogoutRequestUseCase {
  final repository = GetIt.I<LogoutRepository>();
  FutureOr<LogoutResponseModel> execute({required String fcmToken}) async {
    final data = await repository.logoutRequest(fcmToken: fcmToken);
    return toLogoutResponseModel(entities: data);
  }
}

FutureOr<LogoutResponseModel> toLogoutResponseModel(
    {required LogoutResponseEntity entities}) {
  return LogoutResponseModel(message: entities.message, error: entities.error);
}
