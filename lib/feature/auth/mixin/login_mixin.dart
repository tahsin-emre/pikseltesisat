import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/feature/auth/view/login_view.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';

mixin LoginMixin on State<LoginView> {
  late final _authCubit = context.read<AuthCubit>();
  final formKey = GlobalKey<FormState>();
  final loadingNotifier = ValueNotifier<bool>(false);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    loadingNotifier.value = true;
    await _authCubit.login(
      email: emailController.text,
      password: passwordController.text,
    );
    loadingNotifier.value = false;

    navigateToSplash();
  }

  void navigateToSplash() {
    const SplashRoute().go(context);
  }
}
