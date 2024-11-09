import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/splash/view/splash_view.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';

mixin SplashMixin on State<SplashView> {
  @override
  void initState() {
    super.initState();
    currentUser();
  }

  Future<void> currentUser() async {
    await Future.delayed(
      Durations.extralong4,
      navigateToLogin,
    );
  }

  void navigateToLogin() {
    const LoginRoute().go(context);
  }

  void navigateToAdminApp() {}
  void navigateToPlumberApp() {}
}
