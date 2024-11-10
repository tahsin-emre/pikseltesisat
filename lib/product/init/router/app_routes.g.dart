// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainShellRoute,
      $loginRoute,
      $splashRoute,
      $customerCreateRoute,
      $customerDetailRoute,
    ];

RouteBase get $mainShellRoute => ShellRouteData.$route(
      navigatorKey: MainShellRoute.$navigatorKey,
      factory: $MainShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/main/dashboard',
          parentNavigatorKey: DashboardRoute.$parentNavigatorKey,
          factory: $DashboardRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/main/customer-list',
          parentNavigatorKey: CustomerListRoute.$parentNavigatorKey,
          factory: $CustomerListRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/main/plumber-list',
          parentNavigatorKey: PlumberListRoute.$parentNavigatorKey,
          factory: $PlumberListRouteExtension._fromState,
        ),
      ],
    );

extension $MainShellRouteExtension on MainShellRoute {
  static MainShellRoute _fromState(GoRouterState state) =>
      const MainShellRoute();
}

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  String get location => GoRouteData.$location(
        '/main/dashboard',
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
        '/main/customer-list',
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
        '/main/plumber-list',
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

RouteBase get $customerCreateRoute => GoRouteData.$route(
      path: '/customer/create',
      parentNavigatorKey: CustomerCreateRoute.$parentNavigatorKey,
      factory: $CustomerCreateRouteExtension._fromState,
    );

extension $CustomerCreateRouteExtension on CustomerCreateRoute {
  static CustomerCreateRoute _fromState(GoRouterState state) =>
      CustomerCreateRoute(
        state.extra as Customer?,
      );

  String get location => GoRouteData.$location(
        '/customer/create',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $customerDetailRoute => GoRouteData.$route(
      path: '/customer/detail',
      parentNavigatorKey: CustomerDetailRoute.$parentNavigatorKey,
      factory: $CustomerDetailRouteExtension._fromState,
    );

extension $CustomerDetailRouteExtension on CustomerDetailRoute {
  static CustomerDetailRoute _fromState(GoRouterState state) =>
      CustomerDetailRoute(
        state.extra as Customer,
      );

  String get location => GoRouteData.$location(
        '/customer/detail',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
