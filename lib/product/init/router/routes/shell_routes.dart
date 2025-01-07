part of '../app_routes.dart';

final class DashboardRoute extends GoRouteData {
  const DashboardRoute();
  static const String path = '/main/dashboard';
  static final $parentNavigatorKey = AppRouter.mainShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const DashboardView());
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

final class WorkListRoute extends GoRouteData {
  const WorkListRoute();
  static const String path = '/main/work-list';
  static final $parentNavigatorKey = AppRouter.mainShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const WorkListView());
  }
}
