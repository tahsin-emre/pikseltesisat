part of '../app_routes.dart';

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
final class LoginRoute extends GoRouteData {
  const LoginRoute();
  static const String path = '/login';
  static final $parentNavigatorKey = AppRouter.rootNavigatorKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const LoginView());
  }
}

@TypedGoRoute<RegisterRoute>(path: RegisterRoute.path)
final class RegisterRoute extends GoRouteData {
  const RegisterRoute();
  static const String path = '/register';
  static final $parentNavigatorKey = AppRouter.rootNavigatorKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const RegisterView());
  }
}

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
final class SplashRoute extends GoRouteData {
  const SplashRoute();
  static const String path = '/splash';
  static final $parentNavigatorKey = AppRouter.rootNavigatorKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const SplashView());
  }
}

final class DashboardRoute extends GoRouteData {
  const DashboardRoute();
  static const String path = '/main/dashboard';
  static final $parentNavigatorKey = AppRouter.mainShellKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const DashboardView());
  }
}

@TypedGoRoute<WaitingRoute>(path: WaitingRoute.path)
final class WaitingRoute extends GoRouteData {
  const WaitingRoute();
  static const String path = '/waiting';
  static final $parentNavigatorKey = AppRouter.rootNavigatorKey;
  @override
  AppPage buildPage(BuildContext context, GoRouterState state) {
    return AppPage(child: const WaitingView());
  }
}
