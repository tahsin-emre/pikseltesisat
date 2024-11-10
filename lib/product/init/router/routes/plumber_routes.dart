part of '../app_routes.dart';

@TypedGoRoute<PlumberCreateRoute>(path: PlumberCreateRoute.path)
final class PlumberCreateRoute extends GoRouteData {
  const PlumberCreateRoute([this.$extra]);
  static const String path = '/plumber/create';
  static final $parentNavigatorKey = AppRouter.rootNavigatorKey;
  final Plumber? $extra;

  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: PlumberCreateView(plumber: $extra));
  }
}

@TypedGoRoute<PlumberDetailRoute>(path: PlumberDetailRoute.path)
final class PlumberDetailRoute extends GoRouteData {
  const PlumberDetailRoute(this.$extra);
  static const String path = '/plumber/detail';
  static final $parentNavigatorKey = AppRouter.rootNavigatorKey;
  final Plumber $extra;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: PlumberDetailView(plumber: $extra));
  }
}
