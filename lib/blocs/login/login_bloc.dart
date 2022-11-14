import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '/core/consts/app_consts.dart';
import '/core/consts/storage_keys.dart';
import '/domain/repositories/auth/auth_repository.dart';
import '/domain/usecase/login/login_use_case.dart';
import '/infrastructure/storage/laf_Key_value_store.dart';
import '/presentation/utils/fcm_token.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final getLoginUseCase = GetIt.I<LoginRequestUseCase>();
  final authRepository = GetIt.I<AuthRepository>();
  final _sharedPref = GetIt.I<LafKeyValueStore>();

  LoginBloc() : super(LoginInitialState()) {
    on<LoginOnLoadEvent>(_onLoadState);
    on<LoginSuccessEvent>(_onSuccessState);
    on<LoginBtnSubmitEvent>(_onSubmitState);
    on<LoginEventWithEmailAndPassword>(_onLoginEventWithEmailAndPassword);
    on<SignUpWithEmailAndPassword>(_onSignUpWithEmailAndPassword);
    on<SocialLoginEvent>(_onSocialLoginState);
  }

  FutureOr<void> _onLoadState(
      LoginOnLoadEvent event, Emitter<LoginState> emit) async {
    late bool emailValid;
    late bool passwordValid;
    emailValid = AppConsts.emailRegex.hasMatch(event.emailValue);
    final packageInfo = await PackageInfo.fromPlatform();
    final appVersionInfo = packageInfo.packageName
                .split('.')
                .last
                .toLowerCase() !=
            'prod'
        ? '${packageInfo.packageName.split('.').last} - ${packageInfo.version}'
        : '';
    passwordValid = event.passwordValue.length > 6;
    emit(LoginOnLoadState(
      isEmailError: (!emailValid && event.emailValue.isNotEmpty),
      isPasswordError: (!passwordValid && event.passwordValue.isNotEmpty),
      isObscure: event.isObscure,
      emailValue: event.emailValue,
      passwordValue: event.passwordValue,
      buttonClicked: event.buttonClicked,
      dateTime: event.dateTime,
      appVersionInfo: appVersionInfo,
    ));
  }

  FutureOr<void> _onSuccessState(
      LoginSuccessEvent event, Emitter<LoginState> emit) {
    emit(const LoginSuccessState());
  }

  Future<FutureOr<void>> _onSubmitState(
      LoginBtnSubmitEvent event, Emitter<LoginState> emit) async {
    var fcmToken =
        await _sharedPref.read(StorageKeys.fcmToken, defaultValue: '');
    if (fcmToken == '') {
      await fetchFcmToken();
      fcmToken = await _sharedPref.read(StorageKeys.fcmToken, defaultValue: '');
    }
    emit(LoginOnLoadState(
      isObscure: event.isObscure,
      isEmailError: event.isEmailError,
      isPasswordError: event.isPasswordError,
      emailValue: event.emailAddress,
      passwordValue: event.password,
      buttonClicked: event.buttonClicked,
    ));
    final loginResponse = await getLoginUseCase.execute(
        username: event.emailAddress,
        password: event.password,
        fcmToken: fcmToken ?? '');

    if (loginResponse != null) {
      if (loginResponse.error == null) {
        emit(const LoginSuccessState());
      } else {
        emit(LoginFailureState(error: loginResponse.error ?? ''));
      }
    } else {
      emit(const LoginFailureState(error: 'something went wrong'));
    }
  }

  Future<void> _onSocialLoginState(
      SocialLoginEvent event, Emitter<LoginState> emit) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
      ],
    );

    try {
      await _googleSignIn.signIn();
      String? userName = _googleSignIn.currentUser?.displayName;
      await authRepository.completeLogin(
          token: '123',
          userName: userName,
          userEmail: _googleSignIn.currentUser?.email);
      emit(const LoginSuccessState());
    } catch (error) {
      emit(LoginFailureState(error: error.toString()));
    }
  }
  Future<void> _onLoginEventWithEmailAndPassword(
      LoginEventWithEmailAndPassword event, Emitter<LoginState> emit) async {

    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.userName,
        password: event.password,
      );
      await authRepository.completeLogin(
          token: '123',
          userName: '',
          userEmail: event.userName);
      emit(const LoginSuccessState());
    } catch (error) {
      print(error.toString());
      emit(LoginFailureState(error: error.toString()));
    }
  }

  Future<void> _onSignUpWithEmailAndPassword(
      SignUpWithEmailAndPassword event, Emitter<LoginState> emit) async {

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.userName,
        password: event.password,
      );
      await authRepository.completeLogin(
          token: '123',
          userName: '',
          userEmail: event.userName);
      emit(const LoginSuccessState());
    } catch (error) {
      print(error.toString());
      emit(LoginFailureState(error: error.toString()));
    }
  }
}
