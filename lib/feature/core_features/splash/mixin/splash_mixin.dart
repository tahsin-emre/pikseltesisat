import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/feature/core_features/splash/view/splash_view.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/utils/extensions/my_user_ext.dart';

mixin SplashMixin on State<SplashView> {
  Future<void> findCurrentUser() async {
    final authCubit = locator<AuthCubit>();
    await authCubit.findCurrentUser();
    if (!mounted) return;
    navigate(authCubit.state.user);
  }

  void navigate(MyUser? user) {
    if (user == null) return const LoginRoute().go(context);
    if (user.isAdmin) return const DashboardRoute().go(context);
    if (user.isPersonal) return const LoginRoute().go(context);
    if (user.isWaiting) return const WaitingRoute().go(context);
  }
}
