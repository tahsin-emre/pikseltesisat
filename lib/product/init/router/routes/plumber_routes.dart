part of '../app_routes.dart';

final class PlumberListRoute extends GoRouteData {
  const PlumberListRoute();
  static const String path = '/main/plumber-list';
  static final $parentNavigatorKey = AppRouter.mainShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const PlumberListView());
  }
}

final class PlumberCreateRoute extends GoRouteData {
  const PlumberCreateRoute([this.$extra]);
  static const String path = '/main/plumber-create';
  static final $parentNavigatorKey = AppRouter.mainShellKey;
  final Plumber? $extra;

  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: PlumberCreateView(plumber: $extra));
  }
}

final class PlumberDetailRoute extends GoRouteData {
  const PlumberDetailRoute(this.$extra);
  static const String path = '/main/plumber-detail';
  static final $parentNavigatorKey = AppRouter.mainShellKey;
  final Plumber $extra;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: PlumberDetailView(plumber: $extra));
  }
}
