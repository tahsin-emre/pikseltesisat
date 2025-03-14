// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainShellRoute,
      $loginRoute,
      $registerRoute,
      $splashRoute,
      $waitingRoute,
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
          path: '/main/search',
          parentNavigatorKey: SearchRoute.$parentNavigatorKey,
          factory: $SearchRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/main/customer-list',
          parentNavigatorKey: CustomerListRoute.$parentNavigatorKey,
          factory: $CustomerListRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/main/customer-create',
          parentNavigatorKey: CustomerCreateRoute.$parentNavigatorKey,
          factory: $CustomerCreateRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/main/customer-details',
          parentNavigatorKey: CustomerDetailRoute.$parentNavigatorKey,
          factory: $CustomerDetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/main/personal-list',
          parentNavigatorKey: PersonalListRoute.$parentNavigatorKey,
          factory: $PersonalListRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/main/personal-create',
          parentNavigatorKey: PersonalCreateRoute.$parentNavigatorKey,
          factory: $PersonalCreateRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/main/personal-detail',
          parentNavigatorKey: PersonalDetailRoute.$parentNavigatorKey,
          factory: $PersonalDetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/main/work-list',
          parentNavigatorKey: WorkListRoute.$parentNavigatorKey,
          factory: $WorkListRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/main/work-create',
          parentNavigatorKey: WorkCreateRoute.$parentNavigatorKey,
          factory: $WorkCreateRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/main/work-detail',
          parentNavigatorKey: WorkDetailRoute.$parentNavigatorKey,
          factory: $WorkDetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/main/price-list',
          parentNavigatorKey: PriceListRoute.$parentNavigatorKey,
          factory: $PriceListRouteExtension._fromState,
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

extension $SearchRouteExtension on SearchRoute {
  static SearchRoute _fromState(GoRouterState state) => const SearchRoute();

  String get location => GoRouteData.$location(
        '/main/search',
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

extension $CustomerCreateRouteExtension on CustomerCreateRoute {
  static CustomerCreateRoute _fromState(GoRouterState state) =>
      CustomerCreateRoute(
        state.extra as Customer?,
      );

  String get location => GoRouteData.$location(
        '/main/customer-create',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $CustomerDetailRouteExtension on CustomerDetailRoute {
  static CustomerDetailRoute _fromState(GoRouterState state) =>
      CustomerDetailRoute(
        state.extra as Customer,
      );

  String get location => GoRouteData.$location(
        '/main/customer-details',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $PersonalListRouteExtension on PersonalListRoute {
  static PersonalListRoute _fromState(GoRouterState state) =>
      const PersonalListRoute();

  String get location => GoRouteData.$location(
        '/main/personal-list',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PersonalCreateRouteExtension on PersonalCreateRoute {
  static PersonalCreateRoute _fromState(GoRouterState state) =>
      PersonalCreateRoute(
        state.extra as Personal?,
      );

  String get location => GoRouteData.$location(
        '/main/personal-create',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $PersonalDetailRouteExtension on PersonalDetailRoute {
  static PersonalDetailRoute _fromState(GoRouterState state) =>
      PersonalDetailRoute(
        state.extra as Personal,
      );

  String get location => GoRouteData.$location(
        '/main/personal-detail',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $WorkListRouteExtension on WorkListRoute {
  static WorkListRoute _fromState(GoRouterState state) => const WorkListRoute();

  String get location => GoRouteData.$location(
        '/main/work-list',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WorkCreateRouteExtension on WorkCreateRoute {
  static WorkCreateRoute _fromState(GoRouterState state) => WorkCreateRoute(
        state.extra as Work?,
      );

  String get location => GoRouteData.$location(
        '/main/work-create',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $WorkDetailRouteExtension on WorkDetailRoute {
  static WorkDetailRoute _fromState(GoRouterState state) => WorkDetailRoute(
        state.extra as Work,
      );

  String get location => GoRouteData.$location(
        '/main/work-detail',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $PriceListRouteExtension on PriceListRoute {
  static PriceListRoute _fromState(GoRouterState state) =>
      const PriceListRoute();

  String get location => GoRouteData.$location(
        '/main/price-list',
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

RouteBase get $registerRoute => GoRouteData.$route(
      path: '/register',
      parentNavigatorKey: RegisterRoute.$parentNavigatorKey,
      factory: $RegisterRouteExtension._fromState,
    );

extension $RegisterRouteExtension on RegisterRoute {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  String get location => GoRouteData.$location(
        '/register',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/',
      parentNavigatorKey: SplashRoute.$parentNavigatorKey,
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waitingRoute => GoRouteData.$route(
      path: '/waiting',
      parentNavigatorKey: WaitingRoute.$parentNavigatorKey,
      factory: $WaitingRouteExtension._fromState,
    );

extension $WaitingRouteExtension on WaitingRoute {
  static WaitingRoute _fromState(GoRouterState state) => const WaitingRoute();

  String get location => GoRouteData.$location(
        '/waiting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
