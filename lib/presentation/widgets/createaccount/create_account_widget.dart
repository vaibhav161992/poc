import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc/core/theme/laf_colors.dart';
import 'package:poc/presentation/widgets/home/home_widget.dart';
import '../../../blocs/login/login_bloc.dart';
import '../../../core/localization/app_localization.dart';
import '../../utils/laf_values.dart';
import '../single_line_input_content.dart';

class CreateAccountWidget extends StatelessWidget {
  static const keyPrefix = 'CreateAccountWidget';
  final String emailValue;
  final String passwordValue;
  final bool isObscure;
  final bool isEmailError;
  final bool isPasswordError;
  final bool? buttonClicked;
  final VoidCallback? onSubmitTap;
  final String? appVersionInfo;
  DateTime? birthDate;

  CreateAccountWidget({
    Key? key,
    required this.emailValue,
    required this.isEmailError,
    required this.passwordValue,
    required this.isPasswordError,
    required this.isObscure,
    required this.onSubmitTap,
    this.buttonClicked,
    this.appVersionInfo,
    this.birthDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: LAFPaddings.paddings16.w,
              vertical: LAFPaddings.paddings30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LAFSpaces.space16.toSpace(),
              LAFSpaces.space16.toSpace(),
              Center(
                child: Text(
                  AppLocalization.of(context)!.translate('create_account'),
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              LAFSpaces.space16.toSpace(),
              LAFSpaces.space16.h.toSpace(),
              SingleLineInputContent(
                labelText: AppLocalization.of(context)!.translate('email'),
                hintText:
                    AppLocalization.of(context)!.translate('requestEmail'),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                errorString: isEmailError
                    ? AppLocalization.of(context)!
                        .translate('requestValidEmail')
                    : null,
                suffixIcon: emailValue.isNotEmpty
                    ? Icon(
                        Icons.done,
                        color: isEmailError ? Colors.red : Colors.green,
                      )
                    : const SizedBox.shrink(),
                onChanged: (changedValue) {
                  BlocProvider.of<LoginBloc>(context).add(LoginOnLoadEvent(
                    emailValue: changedValue,
                    passwordValue: passwordValue,
                    isObscure: isObscure,
                  ));
                },
                onSubmitted: (submittedValue) {},
                enabledField: buttonClicked == null || buttonClicked == false
                    ? true
                    : false,
              ),
              LAFSpaces.space8.h.toSpace(),
              SingleLineInputContent(
                labelText: AppLocalization.of(context)!.translate('password'),
                obscureText: isObscure,
                hintText:
                    AppLocalization.of(context)!.translate('requestPassword'),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                suffixIcon: InkWell(
                  child: isObscure
                      ? const Icon(
                          Icons.visibility_off,
                        )
                      : const Icon(
                          Icons.remove_red_eye_sharp,
                        ),
                  onTap: () {
                    BlocProvider.of<LoginBloc>(context).add(LoginOnLoadEvent(
                        isObscure: !isObscure,
                        passwordValue: passwordValue,
                        emailValue: emailValue));
                  },
                ),
                errorString: isPasswordError
                    ? AppLocalization.of(context)!.translate('passwordLength')
                    : null,
                onChanged: (changedValue) {
                  BlocProvider.of<LoginBloc>(context).add(LoginOnLoadEvent(
                    passwordValue: changedValue,
                    emailValue: emailValue,
                    isObscure: isObscure,
                  ));
                },
                onSubmitted: (submittedValue) {},
                enabledField: buttonClicked == null || buttonClicked == false
                    ? true
                    : false,
              ),
              LAFSpaces.space4.h.toSpace(),
              LAFSpaces.space8.h.toSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalization.of(context)!
                      .translate('select_birthdate')),
                  TextButton(
                      onPressed: () async {
                        birthDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1975),
                            lastDate: DateTime.now());
                        BlocProvider.of<LoginBloc>(context).add(
                            LoginOnLoadEvent(
                                emailValue: emailValue,
                                passwordValue: passwordValue,
                                isObscure: isObscure,dateTime:birthDate));
                      },
                      child: birthDate == null
                          ? const Icon(Icons.calendar_month)
                          : Text(
                              birthDate!.toIso8601String().substring(0, 10))),
                ],
              ),
              LAFSpaces.space4.h.toSpace(),
              LAFSpaces.space8.h.toSpace(),
              Visibility(
                visible: true,
                child: RichText(
                  text: TextSpan(
                    text: AppLocalization.of(context)!
                        .translate('privacyPolicy1'),
                    style: Theme.of(context).textTheme.caption,
                    children: [
                      TextSpan(
                        text: AppLocalization.of(context)!
                            .translate('privacyPolicy2'),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: Theme.of(context).textTheme.caption,
                      ),
                      TextSpan(
                        text: AppLocalization.of(context)!
                            .translate('privacyPolicy3'),
                      ),
                      TextSpan(
                        text: AppLocalization.of(context)!
                            .translate('privacyPolicy4'),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: Theme.of(context).textTheme.caption,
                      ),
                      TextSpan(
                        text: AppLocalization.of(context)!
                            .translate('privacyPolicy5'),
                      ),
                    ],
                  ),
                ),
              ),
              LAFSpaces.space4.h.toSpace(),
              LAFSpaces.space8.h.toSpace(),
              SizedBox(
                  width: 1.sw,
                  child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: isEmailError || isPasswordError
                          ? null
                          : () {
                              BlocProvider.of<LoginBloc>(context).add(
                                  SignUpWithEmailAndPassword(
                                      userName: emailValue,
                                      password: passwordValue));
                            },
                      child: Text(
                        AppLocalization.of(context)!
                            .translate('create_account'),
                        style: TextStyle(color: LAFColors.ltWhiteColor),
                      ))),
              LAFSpaces.space4.h.toSpace(),
              LAFSpaces.space8.h.toSpace(),
            ],
          ),
        ),
      ),
    );
  }
}
