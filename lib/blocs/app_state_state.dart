part of 'app_state_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object?> get props => [];
}

class AppStateInitial extends AppState {
  const AppStateInitial();
}

class AppRootState extends AppState {
  const AppRootState();
}

class AppLoginState extends AppState {
  const AppLoginState();
}

class AppLoadingState extends AppState {
  const AppLoadingState();
}

class AppLoggedOutState extends AppState {
  const AppLoggedOutState();
}

class NotificationPermissionState extends AppState {
  const NotificationPermissionState();
}

class AppLogoutErrorState extends AppState {
  final String message;
  const AppLogoutErrorState({required this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}
