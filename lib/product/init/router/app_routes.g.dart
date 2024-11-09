// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $adminShellRoute,
      $loginRoute,
      $splashRoute,
    ];

RouteBase get $adminShellRoute => ShellRouteData.$route(
      navigatorKey: AdminShellRoute.$navigatorKey,
      factory: $AdminShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/admin/dashboard',
          parentNavigatorKey: DashboardRoute.$parentNavigatorKey,
          factory: $DashboardRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/admin/customer-list',
          parentNavigatorKey: CustomerListRoute.$parentNavigatorKey,
          factory: $CustomerListRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/admin/plumber-list',
          parentNavigatorKey: PlumberListRoute.$parentNavigatorKey,
          factory: $PlumberListRouteExtension._fromState,
        ),
      ],
    );

extension $AdminShellRouteExtension on AdminShellRoute {
  static AdminShellRoute _fromState(GoRouterState state) =>
      const AdminShellRoute();
}

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  String get location => GoRouteData.$location(
        '/admin/dashboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CustomerListRouteExtension on CustomerListRoute {
  static CustomerListRoute _fromState(GoRouterState state) =>
      const CustomerListRoute();

  String get location => GoRouteData.$location(
        '/admin/customer-list',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PlumberListRouteExtension on PlumberListRoute {
  static PlumberListRoute _fromState(GoRouterState state) =>
      const PlumberListRoute();

  String get location => GoRouteData.$location(
        '/admin/plumber-list',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      parentNavigatorKey: LoginRoute.$parentNavigatorKey,
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      parentNavigatorKey: SplashRoute.$parentNavigatorKey,
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
