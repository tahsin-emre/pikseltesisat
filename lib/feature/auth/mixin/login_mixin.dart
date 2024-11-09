import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/auth/view/login_view.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';

mixin LoginMixin on State<LoginView> {
  void login() {}

  void navigateToSplash() {
    const SplashRoute().go(context);
  }
}
