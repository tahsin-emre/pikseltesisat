import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pikseltesisat/feature/core_features/splash/cubit/splash_cubit.dart';
import 'package:pikseltesisat/feature/core_features/splash/cubit/splash_state.dart';
import 'package:pikseltesisat/feature/core_features/splash/mixin/splash_mixin.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/utils/constants/app_constants.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/extensions/app_sizes_ext.dart';

final class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SplashMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..initialize(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.isInitialized) findCurrentUser();
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcons.personals.toCustomIcon(size: AppSizes.maxiL),
                AppSizes.m.toHeight,
                Text(
                  AppConstants.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                AppSizes.xl.toHeight,
                const SpinKitCircle(color: Colors.blue),
                AppSizes.m.toHeight,
                Text(
                  LocaleKeys.base_loading.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
