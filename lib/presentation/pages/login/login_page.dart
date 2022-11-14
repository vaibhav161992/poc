import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/presentation/pages/laf_page.dart';
import '/routes/page_routes.dart';

import '../../../blocs/login/login_bloc.dart';
import '../../views/login/login_view.dart';

class LoginPage extends LAFPage<void> {
  LoginPage()
      : super(
          keyValue: InitialPageRoutes.login,
          routeName: InitialPageRoutes.login,
        );

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => BlocProvider<LoginBloc>(
        create: (context) => LoginBloc()..add( LoginOnLoadEvent()),
        child: const LoginView(),
      ),
    );
  }
}
