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
      $dashboardRoute,
      $searchRoute,
      $waitingRoute,
    ];

RouteBase get $mainShellRoute => ShellRouteData.$route(
      navigatorKey: MainShellRoute.$navigatorKey,
      factory: $MainShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/main/customer-list',
          parentNavigatorKey: CustomerListRoute.$parentNavigatorKey,
          factory: _$CustomerListRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/main/customer-create',
          parentNavigatorKey: CustomerCreateRoute.$parentNavigatorKey,
          factory: _$CustomerCreateRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/main/customer-details',
          parentNavigatorKey: CustomerDetailRoute.$parentNavigatorKey,
          factory: _$CustomerDetailRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/main/personal-list',
          parentNavigatorKey: PersonalListRoute.$parentNavigatorKey,
          factory: _$PersonalListRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/main/personal-create',
          parentNavigatorKey: PersonalCreateRoute.$parentNavigatorKey,
          factory: _$PersonalCreateRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/main/personal-detail',
          parentNavigatorKey: PersonalDetailRoute.$parentNavigatorKey,
          factory: _$PersonalDetailRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/main/work-list',
          parentNavigatorKey: WorkListRoute.$parentNavigatorKey,
          factory: _$WorkListRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/main/work-create',
          parentNavigatorKey: WorkCreateRoute.$parentNavigatorKey,
          factory: _$WorkCreateRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/main/work-detail',
          parentNavigatorKey: WorkDetailRoute.$parentNavigatorKey,
          factory: _$WorkDetailRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/main/price-list',
          parentNavigatorKey: PriceListRoute.$parentNavigatorKey,
          factory: _$PriceListRoute._fromState,
        ),
      ],
    );

extension $MainShellRouteExtension on MainShellRoute {
  static MainShellRoute _fromState(GoRouterState state) =>
      const MainShellRoute();
}

mixin _$CustomerListRoute on GoRouteData {
  static CustomerListRoute _fromState(GoRouterState state) =>
      const CustomerListRoute();

  @override
  String get location => GoRouteData.$location(
        '/main/customer-list',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$CustomerCreateRoute on GoRouteData {
  static CustomerCreateRoute _fromState(GoRouterState state) =>
      CustomerCreateRoute(
        state.extra as Customer?,
      );

  CustomerCreateRoute get _self => this as CustomerCreateRoute;

  @override
  String get location => GoRouteData.$location(
        '/main/customer-create',
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin _$CustomerDetailRoute on GoRouteData {
  static CustomerDetailRoute _fromState(GoRouterState state) =>
      CustomerDetailRoute(
        state.extra as Customer,
      );

  CustomerDetailRoute get _self => this as CustomerDetailRoute;

  @override
  String get location => GoRouteData.$location(
        '/main/customer-details',
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin _$PersonalListRoute on GoRouteData {
  static PersonalListRoute _fromState(GoRouterState state) =>
      const PersonalListRoute();

  @override
  String get location => GoRouteData.$location(
        '/main/personal-list',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$PersonalCreateRoute on GoRouteData {
  static PersonalCreateRoute _fromState(GoRouterState state) =>
      PersonalCreateRoute(
        state.extra as Personal?,
      );

  PersonalCreateRoute get _self => this as PersonalCreateRoute;

  @override
  String get location => GoRouteData.$location(
        '/main/personal-create',
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin _$PersonalDetailRoute on GoRouteData {
  static PersonalDetailRoute _fromState(GoRouterState state) =>
      PersonalDetailRoute(
        state.extra as Personal,
      );

  PersonalDetailRoute get _self => this as PersonalDetailRoute;

  @override
  String get location => GoRouteData.$location(
        '/main/personal-detail',
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin _$WorkListRoute on GoRouteData {
  static WorkListRoute _fromState(GoRouterState state) => const WorkListRoute();

  @override
  String get location => GoRouteData.$location(
        '/main/work-list',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$WorkCreateRoute on GoRouteData {
  static WorkCreateRoute _fromState(GoRouterState state) => WorkCreateRoute(
        state.extra as Work?,
      );

  WorkCreateRoute get _self => this as WorkCreateRoute;

  @override
  String get location => GoRouteData.$location(
        '/main/work-create',
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin _$WorkDetailRoute on GoRouteData {
  static WorkDetailRoute _fromState(GoRouterState state) => WorkDetailRoute(
        state.extra as Work,
      );

  WorkDetailRoute get _self => this as WorkDetailRoute;

  @override
  String get location => GoRouteData.$location(
        '/main/work-detail',
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin _$PriceListRoute on GoRouteData {
  static PriceListRoute _fromState(GoRouterState state) =>
      const PriceListRoute();

  @override
  String get location => GoRouteData.$location(
        '/main/price-list',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      parentNavigatorKey: LoginRoute.$parentNavigatorKey,
      factory: _$LoginRoute._fromState,
    );

mixin _$LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location(
        '/login',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute => GoRouteData.$route(
      path: '/register',
      parentNavigatorKey: RegisterRoute.$parentNavigatorKey,
      factory: _$RegisterRoute._fromState,
    );

mixin _$RegisterRoute on GoRouteData {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  @override
  String get location => GoRouteData.$location(
        '/register',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/',
      parentNavigatorKey: SplashRoute.$parentNavigatorKey,
      factory: _$SplashRoute._fromState,
    );

mixin _$SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  @override
  String get location => GoRouteData.$location(
        '/',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $dashboardRoute => GoRouteData.$route(
      path: '/main/dashboard',
      parentNavigatorKey: DashboardRoute.$parentNavigatorKey,
      factory: _$DashboardRoute._fromState,
    );

mixin _$DashboardRoute on GoRouteData {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  @override
  String get location => GoRouteData.$location(
        '/main/dashboard',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $searchRoute => GoRouteData.$route(
      path: '/main/search',
      parentNavigatorKey: SearchRoute.$parentNavigatorKey,
      factory: _$SearchRoute._fromState,
    );

mixin _$SearchRoute on GoRouteData {
  static SearchRoute _fromState(GoRouterState state) => const SearchRoute();

  @override
  String get location => GoRouteData.$location(
        '/main/search',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waitingRoute => GoRouteData.$route(
      path: '/waiting',
      parentNavigatorKey: WaitingRoute.$parentNavigatorKey,
      factory: _$WaitingRoute._fromState,
    );

mixin _$WaitingRoute on GoRouteData {
  static WaitingRoute _fromState(GoRouterState state) => const WaitingRoute();

  @override
  String get location => GoRouteData.$location(
        '/waiting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
