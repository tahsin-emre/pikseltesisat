import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/feature/sub_features/ui_kit/async_button.dart';
import 'package:pikseltesisat/feature/sub_features/ui_kit/base_app_bar.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/extensions/app_sizes_ext.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class WaitingView extends StatefulWidget {
  const WaitingView({super.key});

  @override
  State<WaitingView> createState() => _WaitingViewState();
}

class _WaitingViewState extends State<WaitingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: LocaleKeys.appName.tr()),
      body: Center(
        child: CustomScrollView(
          slivers: [
            Text(nameText).toSliver,
            Text(LocaleKeys.login_waitingForConfirmation.tr()).toSliver,
            AppSizes.s.toHeight.toSliver,
            AsyncButton(
              onTap: signOut,
              label: LocaleKeys.drawer_logout.tr(),
            ).toSliver,
          ],
        ),
      ),
    );
  }

  String get nameText {
    final userName = locator<AuthCubit>().state.user?.name;
    return LocaleKeys.base_welcome.tr(args: [userName ?? '']);
  }

  Future<void> signOut() async {
    await locator<AuthCubit>().logout();
    goToSplash();
  }

  void goToSplash() => const SplashRoute().go(context);
}
