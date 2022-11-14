import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final String? accessToken;
  final String? role;
  final String? error;
  final int? statusCode;

  const LoginResponseModel({
    required this.accessToken,
    required this.role,
    this.error,
    this.statusCode,
  });

  LoginResponseModel copyWith({
    String? storeId,
    String? displayAddress,
  }) {
    return LoginResponseModel(
      accessToken: accessToken,
      role: role,
      statusCode: statusCode,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        accessToken,
        role,
        statusCode,
        error,
      ];
}
