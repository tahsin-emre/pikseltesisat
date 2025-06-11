part of '../app_routes.dart';

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
final class LoginRoute extends GoRouteData with _$LoginRoute {
  const LoginRoute();
  static const path = '/login';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.rootNavigatorKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const LoginView());
  }
}

@TypedGoRoute<RegisterRoute>(path: RegisterRoute.path)
final class RegisterRoute extends GoRouteData with _$RegisterRoute {
  const RegisterRoute();
  static const path = '/register';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.rootNavigatorKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const RegisterView());
  }
}

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
final class SplashRoute extends GoRouteData with _$SplashRoute {
  const SplashRoute();
  static const path = '/';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashView();
  }
}

@TypedGoRoute<DashboardRoute>(path: DashboardRoute.path)
final class DashboardRoute extends GoRouteData with _$DashboardRoute {
  const DashboardRoute();
  static const String path = '/main/dashboard';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.mainShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const DashboardView());
  }
}

@TypedGoRoute<SearchRoute>(path: SearchRoute.path)
final class SearchRoute extends GoRouteData with _$SearchRoute {
  const SearchRoute();
  static const String path = '/main/search';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.mainShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const SearchListView());
  }
}

@TypedGoRoute<WaitingRoute>(path: WaitingRoute.path)
final class WaitingRoute extends GoRouteData with _$WaitingRoute {
  const WaitingRoute();
  static const path = '/waiting';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouter.rootNavigatorKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const WaitingView());
  }
}
