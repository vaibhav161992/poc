import 'package:equatable/equatable.dart';

class LogoutResponseModel extends Equatable {
  final String? message;
  final String? error;

  const LogoutResponseModel({
    this.message,
    this.error,
  });

  LogoutResponseModel copyWith({
    String? message,
    String? error,
  }) {
    return LogoutResponseModel(
      message: message,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        message,
        error,
      ];
}
