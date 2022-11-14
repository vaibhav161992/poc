
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/presentation/pages/laf_page.dart';

import '../../../blocs/settings/settings_bloc.dart';
import '../../../routes/page_routes.dart';
import '../../utils/responsive.dart';
import '../../views/setting/settings_view.dart';

class SettingsPage extends LAFPage<void> {
  SettingsPage()
      : super(
    keyValue: InitialPageRoutes.settings,
    routeName: InitialPageRoutes.settings,
  );

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (context) => BlocProvider<SettingsBloc>(
            create: (context) =>
            SettingsBloc()..add(const SettingsOnLoadEvent()),
            child: const Responsive(
              mobile: SettingsView(),
              desktop: Scaffold(
                body: Center(
                  child: Text('Desktop Design Coming soon'),
                ),
              ),
            )));
  }
}