import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/app_state_bloc.dart';
import '/blocs/login/login_bloc.dart';
import '/presentation/views/loading_view.dart';
import '/presentation/widgets/login/login_widget.dart';

class LoginView extends StatelessWidget {
  static const keyPrefix = 'LoginView';
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Fimber.d('Login Success Received at Widget tree!!!');
          BlocProvider.of<AppStateBloc>(context)
              .add(const CheckAppStateEvent());
        }

        if (state is LoginFailureState && state.error.isNotEmpty) {

        }
      },
      buildWhen: (previousState, currentState) {
        if (currentState is LoginFailureState) {
          return false;
        } else {
          return true;
        }
      },
      builder: (context, state) {
        if (state is LoginOnLoadState) {
          return LoginWidget(
            isEmailError: state.isEmailError,
            isPasswordError: state.isPasswordError,
            isObscure: state.isObscure,
            emailValue: state.emailValue,
            passwordValue: state.passwordValue,
            buttonClicked: state.buttonClicked,
            appVersionInfo: state.appVersionInfo,
            onSubmitTap: (!state.isEmailError && !state.isPasswordError) &&
                    (state.emailValue.isNotEmpty &&
                        state.passwordValue.isNotEmpty)
                ? () {
                    BlocProvider.of<LoginBloc>(context).add(LoginBtnSubmitEvent(
                      isEmailError: state.isEmailError,
                      isPasswordError: state.isPasswordError,
                      isObscure: state.isObscure,
                      emailAddress: state.emailValue,
                      password: state.passwordValue,
                    ));
                  }
                : null,
          );
        } else {
          return const LoadingView();
        }
      },
    );
  }
}
