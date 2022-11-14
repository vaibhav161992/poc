import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '/domain/repositories/auth/auth_repository.dart';
import '/domain/usecase/logout/logout_request_use_case.dart';

part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppState> {
  final AuthRepository authRepository = GetIt.I<AuthRepository>();
  final getLogoutUseCase = GetIt.I<LogoutRequestUseCase>();

  AppStateBloc() : super(const AppStateInitial()) {
    on<CheckAppStateEvent>((_, emit) => _checkAppState(emit));
    on<LoginAppStateEvent>(_checkLoginState);
    on<LogoutAppStateEvent>(_logoutAppState);
  }

  FutureOr<void> _checkAppState(Emitter<AppState> emit) async {
    final loggedIn = await authRepository.hasCompleteLogin();

    if (loggedIn == null || loggedIn == false) {
      emit(const AppLoginState());
    } else {
      emit(const AppRootState());
    }
  }

  Future<void> _logoutAppState(
      LogoutAppStateEvent event, Emitter<AppState> emit) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
      ],
    );
    _googleSignIn.disconnect();
    if(FirebaseAuth.instance.currentUser!=null){
      FirebaseAuth.instance.signOut();
    }
    await authRepository.hasLogout();
    emit(const AppLoggedOutState());
  }

  FutureOr<void> _checkLoginState(
      LoginAppStateEvent event, Emitter<AppState> emit) async {
    _checkAppState(emit);
  }
}
