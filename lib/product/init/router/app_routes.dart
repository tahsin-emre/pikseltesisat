import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pikseltesisat/feature/core_features/auth/view/login_view.dart';
import 'package:pikseltesisat/feature/core_features/auth/view/register_view.dart';
import 'package:pikseltesisat/feature/core_features/auth/view/waiting_view.dart';
import 'package:pikseltesisat/feature/core_features/main/view/main_view.dart';
import 'package:pikseltesisat/feature/core_features/splash/view/splash_view.dart';
import 'package:pikseltesisat/feature/customers/view/customer_create_view.dart';
import 'package:pikseltesisat/feature/customers/view/customer_detail_view.dart';
import 'package:pikseltesisat/feature/customers/view/customer_list_view.dart';
import 'package:pikseltesisat/feature/dashboard/view/dashboard_view.dart';
import 'package:pikseltesisat/feature/personals/view/personal_create_view.dart';
import 'package:pikseltesisat/feature/personals/view/personal_detail_view.dart';
import 'package:pikseltesisat/feature/personals/view/personal_list_view.dart';
import 'package:pikseltesisat/feature/price/view/price_list_view.dart';
import 'package:pikseltesisat/feature/search/view/search_list_view.dart';
import 'package:pikseltesisat/feature/works/view/work_create_view.dart';
import 'package:pikseltesisat/feature/works/view/work_detail_view.dart';
import 'package:pikseltesisat/feature/works/view/work_list_view.dart';
import 'package:pikseltesisat/product/init/router/app_router.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/models/work/work.dart';

part 'app_routes.g.dart';
part 'routes/customer_routes.dart';
part 'routes/main_routes.dart';
part 'routes/personal_routes.dart';
part 'routes/work_routes.dart';
part 'routes/price_routes.dart';

@TypedShellRoute<MainShellRoute>(
  routes: [
    // //Core Routes
    // TypedGoRoute<DashboardRoute>(path: DashboardRoute.path),
    // TypedGoRoute<SearchRoute>(path: SearchRoute.path),
    //Customer Routes
    TypedGoRoute<CustomerListRoute>(path: CustomerListRoute.path),
    TypedGoRoute<CustomerCreateRoute>(path: CustomerCreateRoute.path),
    TypedGoRoute<CustomerDetailRoute>(path: CustomerDetailRoute.path),

    //Personal Routes
    TypedGoRoute<PersonalListRoute>(path: PersonalListRoute.path),
    TypedGoRoute<PersonalCreateRoute>(path: PersonalCreateRoute.path),
    TypedGoRoute<PersonalDetailRoute>(path: PersonalDetailRoute.path),

    //Work Routes
    TypedGoRoute<WorkListRoute>(path: WorkListRoute.path),
    TypedGoRoute<WorkCreateRoute>(path: WorkCreateRoute.path),
    TypedGoRoute<WorkDetailRoute>(path: WorkDetailRoute.path),

    //Price Routes
    TypedGoRoute<PriceListRoute>(path: PriceListRoute.path),
  ],
)
final class MainShellRoute extends ShellRouteData {
  const MainShellRoute();
  static final GlobalKey<NavigatorState> $navigatorKey = AppRouter.mainShellKey;
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
