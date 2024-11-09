import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pikseltesisat/feature/customers/view/customer_list_view.dart';
import 'package:pikseltesisat/feature/main/view/main_view.dart';
import 'package:pikseltesisat/feature/plumbers/view/plumber_list_view.dart';
import 'package:pikseltesisat/product/init/router/app_router.dart';

part 'routes/main_routes.dart';
part 'app_routes.g.dart';

@TypedShellRoute<MainShellRoute>(
  routes: [
    TypedGoRoute<CustomerListRoute>(path: CustomerListRoute.path),
    TypedGoRoute<PlumberListRoute>(path: PlumberListRoute.path),
  ],
)
final class MainShellRoute extends ShellRouteData {
  const MainShellRoute();
  static final $navigatorKey = AppRouter.mainShellKey;
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
