import 'package:flutter/material.dart';

import '../../routes/page_routes.dart';
import '../views/loading_view.dart';
import 'laf_page.dart';

class LoadingPage extends LAFPage<void> {
  LoadingPage()
      : super(
          keyValue: InitialPageRoutes.loading,
          routeName: InitialPageRoutes.loading,
        );

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const LoadingView(),
    );
  }
}
