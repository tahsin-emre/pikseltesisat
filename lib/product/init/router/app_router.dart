import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';

final class AppRouter {
  const AppRouter._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final mainShellKey = GlobalKey<NavigatorState>();

  static GoRouter config = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: SplashRoute.path,
    routes: $appRoutes,
  );
}
