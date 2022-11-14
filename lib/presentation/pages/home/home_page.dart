import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/blocs/home/home_bloc.dart';
import '../../views/home/home_view.dart';
import '/presentation/pages/laf_page.dart';
import '/routes/page_routes.dart';

import '../../../blocs/login/login_bloc.dart';
import '../../views/login/login_view.dart';

class HomePage extends LAFPage<void> {
  HomePage()
      : super(
    keyValue: InitialPageRoutes.home,
    routeName: InitialPageRoutes.home,
  );

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => BlocProvider<HomeBloc>(
        create: (context) => HomeBloc()..add(const HomeOnLoadEvent()),
        child: const HomeView(),
      ),
    );
  }
}
