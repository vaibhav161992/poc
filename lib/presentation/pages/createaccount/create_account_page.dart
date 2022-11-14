import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/presentation/views/createaccount/create_account_view.dart';
import '/presentation/pages/laf_page.dart';
import '/routes/page_routes.dart';

import '../../../blocs/login/login_bloc.dart';
import '../../views/login/login_view.dart';

class CreateAccountPage extends LAFPage<void> {
  CreateAccountPage()
      : super(
    keyValue: InitialPageRoutes.createAccount,
    routeName: InitialPageRoutes.createAccount,
  );

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => BlocProvider<LoginBloc>(
        create: (context) => LoginBloc()..add( LoginOnLoadEvent()),
        child: const CreateAccountView(),
      ),
    );
  }
}
