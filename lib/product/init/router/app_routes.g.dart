// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainShellRoute,
    ];

RouteBase get $mainShellRoute => ShellRouteData.$route(
      navigatorKey: MainShellRoute.$navigatorKey,
      factory: $MainShellRouteExtension._fromState,
      routes: [
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
