part of '../app_routes.dart';

@TypedGoRoute<CustomerCreateRoute>(path: CustomerCreateRoute.path)
final class CustomerCreateRoute extends GoRouteData {
  const CustomerCreateRoute([this.$extra]);
  static const String path = '/customer/create';
  static final $parentNavigatorKey = AppRouter.rootNavigatorKey;
  final Customer? $extra;

  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: CustomerCreateView(customer: $extra));
  }
}

@TypedGoRoute<CustomerDetailRoute>(path: CustomerDetailRoute.path)
final class CustomerDetailRoute extends GoRouteData {
  const CustomerDetailRoute(this.$extra);
  static const String path = '/customer/detail';
  static final $parentNavigatorKey = AppRouter.rootNavigatorKey;
  final Customer $extra;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: CustomerDetailView(customer: $extra));
  }
}
