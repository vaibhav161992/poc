import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

/// Observes all routing interactions and reports them to Sentry as
/// breadcrumbs if/when an error is reported.
class RouteMasterLogObserver extends RoutemasterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    Fimber.d('Pushed ${route.settings.name}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    Fimber.d('Popped ${route.settings.name}');
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    Fimber.d(
        'Replaced ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
    super.didReplace(oldRoute: oldRoute, newRoute: newRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    Fimber.d(
        'Removed ${previousRoute?.settings.name}, back to ${route.settings.name}');
    super.didRemove(route, previousRoute);
  }
}
