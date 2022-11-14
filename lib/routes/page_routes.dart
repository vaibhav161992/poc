
import 'package:poc/presentation/pages/createaccount/create_account_page.dart';
import 'package:poc/presentation/pages/settings/settings_page.dart';
import 'package:routemaster/routemaster.dart';
import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/loading_page.dart';
import '../presentation/pages/login/login_page.dart';


class InitialPageRoutes {
  // root
  static const root = '/';
  static const notificationPermission = '/notificationPermission';
  static const notFound = '/404';
  static const loading = '/loading';
  static const loggedIn = '/loggedIn';
  static const createAccount = '/createAccount';

  // forgot pin
  static const forgotPin = '/forgotPin';

  // logged-out routes
  static const login = '/login';

  // logged-in routes
  static const home = '/home';
  static const settings = '/settings';
}

class RelativePageRoutes {
  static const login = '/login';
  static const settings = '/settings';
}

class PageRoutes {
  static final loading = RouteMap(
    routes: {
      InitialPageRoutes.loading: (_) => LoadingPage(),
    },
    onUnknownRoute: (path) => Redirect(
      InitialPageRoutes.loading,
      queryParameters: {'path': path},
    ),
  );

  static final root = RouteMap(routes: {
    InitialPageRoutes.root:(_)=> HomePage(),
    RelativePageRoutes.settings:(_)=>SettingsPage()
  },
    onUnknownRoute: (path) => Redirect(
      InitialPageRoutes.loading,
      queryParameters: {'path': path},
    ),
  );

  static final loggedOut = RouteMap(
    routes: {
      InitialPageRoutes.root: (_) => LoginPage(),
    },
    onUnknownRoute: (path) => const Redirect(InitialPageRoutes.login),
  );

  static final login = RouteMap(
    routes: {
      InitialPageRoutes.login: (_) => LoginPage(),
      InitialPageRoutes.createAccount:(_)=>CreateAccountPage(),
    },
    onUnknownRoute: (path) => const Redirect(InitialPageRoutes.login),
  );


  // static String? _parseStringParam(
  //     Map<String, String> params, String paramName) {
  //   final value = params[paramName];
  //   if (value != null && value.isNotEmpty) {
  //     return value;
  //   }
  //
  //   return null;
  // }
}
