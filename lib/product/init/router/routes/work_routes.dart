part of '../app_routes.dart';

final class WorkListRoute extends GoRouteData with _$WorkListRoute {
  const WorkListRoute();
  static const String path = '/main/work-list';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.mainShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const WorkListView());
  }
}

final class WorkCreateRoute extends GoRouteData with _$WorkCreateRoute {
  const WorkCreateRoute([this.$extra]);
  static const String path = '/main/work-create';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.mainShellKey;
  final Work? $extra;

  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: WorkCreateView($extra));
  }
}

final class WorkDetailRoute extends GoRouteData with _$WorkDetailRoute {
  const WorkDetailRoute(this.$extra);
  static const String path = '/main/work-detail';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.mainShellKey;
  final Work $extra;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: WorkDetailView(work: $extra));
  }
}
