import 'dart:async';
import 'package:get_it/get_it.dart';

import '../../../data/entities/login/login_response_entity.dart';
import '../../model/login_response_model.dart';
import '../../repositories/login/login_repository.dart';

class LoginRequestUseCase {
  final repository = GetIt.I<LoginRepository>();

  FutureOr<LoginResponseModel?> execute({
    required String username,
    required String password,
    required String fcmToken,
  }) async {
    final data = await repository.loginRequest(
      username: username,
      password: password,
      fcmToken: fcmToken,
    );
    return toLoginResponseModel(entities: data!);
  }

  LoginResponseModel toLoginResponseModel(
      {required final LoginResponseEntity entities}) {
    return LoginResponseModel(
        accessToken: entities.accessToken ?? '',
        role: entities.role ?? '',
        statusCode: entities.status,
        error: entities.error);
  }
}
