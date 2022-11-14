part of 'app_state_bloc.dart';

abstract class AppStateEvent extends Equatable {
  const AppStateEvent();
// coverage:ignore-start
  @override
  List<Object?> get props => [];
// coverage:ignore-end
}

class CheckAppStateEvent extends AppStateEvent {
  const CheckAppStateEvent();
}

class LoginAppStateEvent extends AppStateEvent {
  const LoginAppStateEvent();
}

class LogoutAppStateEvent extends AppStateEvent {
  const LogoutAppStateEvent();
}

class CompleteNotificationPermissionEvent extends AppStateEvent {
  const CompleteNotificationPermissionEvent();
}
