import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_state.dart';
import 'package:pikseltesisat/feature/core_features/splash/view/splash_view.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/utils/extensions/my_user_ext.dart';

mixin SplashMixin on State<SplashView> {
  late final _authCubit = context.read<AuthCubit>();
  AuthState get state => _authCubit.state;

  @override
  void initState() {
    super.initState();
    findCurrentUser();
  }

  Future<void> findCurrentUser() async {
    await _authCubit.findCurrentUser();
    navigate(state.user);
  }

  void navigate(MyUser? user) {
    if (user == null) return const LoginRoute().go(context);
    if (user.isAdmin) return const DashboardRoute().go(context);
    if (user.isPlumber) return const LoginRoute().go(context);
    if (user.isWaiting) return const WaitingRoute().go(context);
  }
}
