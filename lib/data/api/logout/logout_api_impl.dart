import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/repositories/auth/auth_repository.dart';
import '../../../infrastructure/network/end_points.dart';
import '../../../infrastructure/network/laf_api_client.dart';
import '../../entities/logout/logout_response_entities.dart';
import 'logout_api.dart';

class LogoutApiImpl extends LogoutApi {
  final apiClient = GetIt.I<LafApiClient>();
  final authRepository = GetIt.I<AuthRepository>();
  @override
  FutureOr<LogoutResponseEntity> logoutRequest(
      {required String fcmToken}) async {
    final token = await authRepository.getToken();
    return LogoutResponseEntity.fromJson(await apiClient.delete(
      Endpoints.logoutEndPoint,
      data: {'fcmToken': fcmToken},
      options: Options()..headers = <String, dynamic>{'authorization': token},
    ));
  }
}
