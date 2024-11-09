import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pikseltesisat/feature/app_admin/customers/view/customer_list_view.dart';
import 'package:pikseltesisat/feature/app_admin/dashboard/view/dashboard_view.dart';
import 'package:pikseltesisat/feature/app_admin/plumbers/view/plumber_list_view.dart';
import 'package:pikseltesisat/feature/auth/view/login_view.dart';
import 'package:pikseltesisat/feature/main/view/main_view.dart';
import 'package:pikseltesisat/feature/splash/view/splash_view.dart';
import 'package:pikseltesisat/product/init/router/app_router.dart';

part 'app_routes.g.dart';
part 'routes/admin_routes.dart';
part 'routes/main_routes.dart';
part 'routes/plumber_routes.dart';

@TypedShellRoute<AdminShellRoute>(
  routes: [
    TypedGoRoute<DashboradRoute>(path: DashboradRoute.path),
    TypedGoRoute<CustomerListRoute>(path: CustomerListRoute.path),
    TypedGoRoute<PlumberListRoute>(path: PlumberListRoute.path),
  ],
)
final class AdminShellRoute extends ShellRouteData {
  const AdminShellRoute();
  static final $navigatorKey = AppRouter.adminShellKey;
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainView(navigator);
  }
}

final class AppPage extends CustomTransitionPage<void> {
  AppPage({required super.child})
      : super(
          transitionsBuilder: (_, animation, __, ___) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}
