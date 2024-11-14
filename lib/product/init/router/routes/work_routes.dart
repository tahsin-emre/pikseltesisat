part of '../app_routes.dart';

@TypedGoRoute<WorkCreateRoute>(path: WorkCreateRoute.path)
final class WorkCreateRoute extends GoRouteData {
  const WorkCreateRoute([this.$extra]);
  static const String path = '/work/create';
  static final $parentNavigatorKey = AppRouter.rootNavigatorKey;
  final Work? $extra;

  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: WorkCreateView(work: $extra));
  }
}

@TypedGoRoute<WorkDetailRoute>(path: WorkDetailRoute.path)
final class WorkDetailRoute extends GoRouteData {
  const WorkDetailRoute(this.$extra);
  static const String path = '/work/detail';
  static final $parentNavigatorKey = AppRouter.rootNavigatorKey;
  final Work $extra;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: WorkDetailView(work: $extra));
  }
}
