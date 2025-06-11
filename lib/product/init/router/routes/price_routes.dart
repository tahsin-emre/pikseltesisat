part of '../app_routes.dart';

final class PriceListRoute extends GoRouteData with _$PriceListRoute {
  const PriceListRoute();
  static const String path = '/main/price-list';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.mainShellKey;

  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const PriceListView());
  }
}
