part of '../app_routes.dart';

final class CustomerListRoute extends GoRouteData {
  const CustomerListRoute();
  static const String path = '/main/customer-list';
  static final $parentNavigatorKey = AppRouter.mainShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const CustomerListView());
  }
}

final class PlumberListRoute extends GoRouteData {
  const PlumberListRoute();
  static const String path = '/main/plumber-list';
  static final $parentNavigatorKey = AppRouter.mainShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const PlumberListView());
  }
}
