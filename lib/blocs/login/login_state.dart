part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginOnLoadState extends LoginState {
  final bool isEmailError;
  final bool isPasswordError;
  final bool isObscure;
  final String emailValue;
  final String passwordValue;
  final bool? buttonClicked;
  final String? appVersionInfo;
  final DateTime? dateTime;

  const LoginOnLoadState({
    required this.isObscure,
    required this.isEmailError,
    required this.isPasswordError,
    required this.emailValue,
    required this.passwordValue,
    this.buttonClicked,
    this.dateTime,
    this.appVersionInfo,
  });

  @override
  List<Object?> get props => [
        isEmailError,
        isPasswordError,
        isObscure,
        emailValue,
        passwordValue,
        buttonClicked,
        appVersionInfo,
        dateTime
      ];
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState();
}

class LoginFailureState extends LoginState {
  final String error;

  const LoginFailureState({required this.error});

  @override
  List<Object?> get props => [
        error,
      ];
}
