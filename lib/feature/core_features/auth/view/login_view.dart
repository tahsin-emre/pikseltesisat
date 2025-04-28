import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/core_features/auth/mixin/login_mixin.dart';
import 'package:pikseltesisat/feature/core_features/auth/widgets/auth_text_field.dart';
import 'package:pikseltesisat/feature/sub_features/ui_kit/async_button.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';
import 'package:pikseltesisat/product/utils/validators/form_validators.dart';

final class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: CustomScrollView(
            slivers: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/icon.png',
                    height: 300,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    LocaleKeys.appName.tr(),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    LocaleKeys.login_welcome.tr(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ).toSliver,
              AuthTextField(
                label: LocaleKeys.login_email.tr(),
                icon: AppIcons.email,
                controller: emailController,
                isPassword: false,
                validator: FormValidators.email,
              ).toSliver,
              AuthTextField(
                label: LocaleKeys.login_password.tr(),
                icon: AppIcons.password,
                controller: passwordController,
                isPassword: true,
                validator: FormValidators.required,
              ).toSliver,
              Container(
                padding: AppPaddings.allS,
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => const RegisterRoute().push<void>(context),
                  child: Text(
                    LocaleKeys.login_register.tr(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ).toSliver,
              AsyncButton(
                onTap: login,
                label: LocaleKeys.login_login.tr(),
              ).toSliver,
            ],
          ),
        ),
      ),
    );
  }
}
