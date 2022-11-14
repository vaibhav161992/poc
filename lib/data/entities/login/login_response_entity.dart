import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  const LoginResponseEntity({
    this.accessToken,
    this.role,
    this.status,
    this.error,
  });

  final String? accessToken;
  final String? role;
  final String? error;
  final int? status;

  factory LoginResponseEntity.fromJson(dynamic json) => LoginResponseEntity(
        accessToken: json['token'] == null ? null : json['token'] as String?,
        role: json['role'] == null ? null : json['role'] as String?,
        error: json['error'] == null ? null : json['error'] as String?,
        status: json['statusCode'] == null ? null : json['statusCode'] as int?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': accessToken,
        'role': role,
        'error': error,
        'statusCode': status,
      };

  @override
  List<Object?> get props => [
        accessToken,
        role,
        error,
        status,
      ];
}
