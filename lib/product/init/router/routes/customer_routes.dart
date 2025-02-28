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

final class CustomerCreateRoute extends GoRouteData {
  const CustomerCreateRoute([this.$extra]);
  static const String path = '/main/customer-create';
  static final $parentNavigatorKey = AppRouter.mainShellKey;
  final Customer? $extra;

  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: CustomerCreateView(customer: $extra));
  }
}

final class CustomerDetailRoute extends GoRouteData {
  const CustomerDetailRoute(this.$extra);
  static const String path = '/main/customer-details';
  static final $parentNavigatorKey = AppRouter.mainShellKey;
  final Customer $extra;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: CustomerDetailView(customer: $extra));
  }
}
