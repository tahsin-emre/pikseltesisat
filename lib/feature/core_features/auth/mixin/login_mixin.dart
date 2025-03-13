import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/feature/core_features/auth/view/login_view.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/init/methods/toast.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';

mixin LoginMixin on State<LoginView> {
  final _authCubit = locator<AuthCubit>();
  final formKey = GlobalKey<FormState>();
  final loadingNotifier = ValueNotifier<bool>(false);
  final emailController = TextEditingController(text: 'telli@tahsinemre.com');
  final passwordController = TextEditingController(text: 'password');

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    loadingNotifier.value = true;
    final error = await _authCubit.login(
      email: emailController.text,
      password: passwordController.text,
    );
    loadingNotifier.value = false;
    if (error != null) {
      toast(error);
      return;
    }
    navigateToSplash();
  }

  void navigateToSplash() {
    const SplashRoute().go(context);
  }
}
