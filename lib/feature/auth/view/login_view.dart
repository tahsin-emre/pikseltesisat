import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/auth/mixin/login_mixin.dart';
import 'package:pikseltesisat/feature/auth/widgets/login_button.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';

final class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: LocaleKeys.login_login.tr()),
      body: Column(
        children: [
          _TextField(
            label: LocaleKeys.login_email.tr(),
            icon: AppIcons.email,
            controller: emailController,
            isPassword: false,
          ),
          _TextField(
            label: LocaleKeys.login_password.tr(),
            icon: AppIcons.password,
            controller: passwordController,
            isPassword: true,
          ),
          LoginButton(loadingNotifier: loadingNotifier, onTap: login),
        ],
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    required this.label,
    required this.icon,
    required this.controller,
    required this.isPassword,
  });
  final String label;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.allS,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon.toIcon,
        ),
      ),
    );
  }
}
