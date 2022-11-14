import 'package:flutter/material.dart';

import '../../routes/page_routes.dart';
import 'laf_page.dart';

class NotFoundPage extends LAFPage<void> {
  /// The invalid route path that was pushed.
  final String path;

  NotFoundPage({
    required this.path,
    String routeName = InitialPageRoutes.notFound,
  }) : super(keyValue: path, routeName: '$routeName: $path');

  @override
  Route<void> createRoute(BuildContext context) => MaterialPageRoute(
    settings: this,
    builder: (context) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              const Text('Page not found.'),
              Text(path),
            ],
          ),
        ),
      );
    },
  );
}
