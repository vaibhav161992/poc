import 'dart:async';
import 'dart:convert';
import 'package:get_it/get_it.dart';

import '../../../infrastructure/network/end_points.dart';
import '../../../infrastructure/network/laf_api_client.dart';
import '../../entities/login/login_response_entity.dart';
import 'login_api.dart';

class LoginApiImpl extends LoginApi {
  final apiClient = GetIt.I<LafApiClient>();

  @override
  FutureOr<LoginResponseEntity> loginRequest(
      {required String username,
      required String password,
      required String fcmToken}) async {
    final userNamebytes = utf8.encode(username);
    final base64ConvertedUserName = base64.encode(userNamebytes);
    final bytes = utf8.encode(password);
    final base64ConvertedPassword = base64.encode(bytes);

    return LoginResponseEntity.fromJson(await apiClient.post(
      Endpoints.loginEndPoint,
      data: {
        'username': base64ConvertedUserName,
        'password': base64ConvertedPassword,
        'fcmToken': fcmToken
      },
    ));
  }
}
