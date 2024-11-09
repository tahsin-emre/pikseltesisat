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
