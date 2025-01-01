import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/core_features/auth/mixin/register_mixin.dart';
import 'package:pikseltesisat/feature/core_features/auth/widgets/auth_text_field.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/async_button.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/validators/form_validators.dart';

final class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with RegisterMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: LocaleKeys.appName.tr()),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            AuthTextField(
              label: LocaleKeys.login_nameSurname.tr(),
              icon: AppIcons.person,
              controller: nameController,
              validator: FormValidators.required,
              isPassword: false,
            ),
            AuthTextField(
              label: LocaleKeys.login_email.tr(),
              icon: AppIcons.email,
              controller: emailController,
              isPassword: false,
              validator: FormValidators.email,
            ),
            AuthTextField(
              label: LocaleKeys.login_password.tr(),
              icon: AppIcons.password,
              controller: passwordController,
              isPassword: true,
              validator: FormValidators.password,
            ),
            AsyncButton(
              onTap: register,
              label: LocaleKeys.login_register.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
