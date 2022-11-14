import 'dart:convert';

LogoutResponseEntity logoutResponseEntityFromJson(String str) =>
    LogoutResponseEntity.fromJson(json.decode(str));

String logoutResponseEntityToJson(LogoutResponseEntity data) =>
    json.encode(data.toJson());

class LogoutResponseEntity {
  final String? message;
  final String? error;

  LogoutResponseEntity({
    this.message,
    this.error,
  });

  factory LogoutResponseEntity.fromJson(Map<String, dynamic> json) =>
      LogoutResponseEntity(
        message: json['message'] ?? '',
        error: json['error'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'error': error,
      };
}
