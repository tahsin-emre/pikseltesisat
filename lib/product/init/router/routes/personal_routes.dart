part of '../app_routes.dart';

final class PersonalListRoute extends GoRouteData with _$PersonalListRoute {
  const PersonalListRoute();
  static const String path = '/main/personal-list';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.mainShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const PersonalListView());
  }
}

final class PersonalCreateRoute extends GoRouteData with _$PersonalCreateRoute {
  const PersonalCreateRoute([this.$extra]);
  static const String path = '/main/personal-create';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.mainShellKey;
  final Personal? $extra;

  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: PersonalCreateView(personal: $extra));
  }
}

final class PersonalDetailRoute extends GoRouteData with _$PersonalDetailRoute {
  const PersonalDetailRoute(this.$extra);
  static const String path = '/main/personal-detail';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.mainShellKey;
  final Personal $extra;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: PersonalDetailView(personal: $extra));
  }
}
