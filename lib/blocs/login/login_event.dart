part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginOnLoadEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;
  final bool isObscure;
  final bool buttonClicked;
  DateTime? dateTime;

  LoginOnLoadEvent(
      {this.emailValue = '',
      this.isObscure = true,
      this.passwordValue = '',
      this.buttonClicked = false,
      this.dateTime});

  @override
  List<Object?> get props => [emailValue, isObscure, passwordValue, dateTime];
}

class LoginSuccessEvent extends LoginEvent {
  const LoginSuccessEvent();
}

class LoginFailureEvent extends LoginEvent {
  const LoginFailureEvent();
}

class LoginBtnSubmitEvent extends LoginEvent {
  final String emailAddress;
  final String password;
  final bool buttonClicked;
  final bool isEmailError;
  final bool isPasswordError;
  final bool isObscure;

  const LoginBtnSubmitEvent({
    required this.isEmailError,
    required this.isPasswordError,
    required this.isObscure,
    required this.emailAddress,
    required this.password,
    this.buttonClicked = true,
  });

  @override
  List<Object?> get props => [
        emailAddress,
        password,
        buttonClicked,
        isObscure,
        isEmailError,
        isPasswordError,
      ];
}

class SocialLoginEvent extends LoginEvent {}

class LoginEventWithEmailAndPassword extends LoginEvent {
  final String userName;
  final String password;

  const LoginEventWithEmailAndPassword(
      {required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}

class SignUpWithEmailAndPassword extends LoginEvent {
  final String userName;
  final String password;

  const SignUpWithEmailAndPassword(
      {required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}
