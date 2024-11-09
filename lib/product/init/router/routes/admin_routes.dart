part of '../app_routes.dart';

final class DashboradRoute extends GoRouteData {
  const DashboradRoute();
  static const String path = '/admin/dashboard';
  static final $parentNavigatorKey = AppRouter.adminShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const DashboardView());
  }
}

final class CustomerListRoute extends GoRouteData {
  const CustomerListRoute();
  static const String path = '/admin/customer-list';
  static final $parentNavigatorKey = AppRouter.adminShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const CustomerListView());
  }
}

final class PlumberListRoute extends GoRouteData {
  const PlumberListRoute();
  static const String path = '/admin/plumber-list';
  static final $parentNavigatorKey = AppRouter.adminShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const PlumberListView());
  }
}
