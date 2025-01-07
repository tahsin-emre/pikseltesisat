import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/feature/core_features/auth/view/register_view.dart';
import 'package:pikseltesisat/product/init/methods/toast.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';

mixin RegisterMixin on State<RegisterView> {
  late final _authCubit = context.read<AuthCubit>();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    final error = await _authCubit.register(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
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
