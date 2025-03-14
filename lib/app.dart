import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/router/app_router.dart';
import 'package:pikseltesisat/product/init/theme/app_theme.dart';
import 'package:pikseltesisat/product/utils/constants/app_constants.dart';
import 'package:toastification/toastification.dart';

/// Main application widget
final class App extends StatelessWidget {
  /// Default constructor
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: AppRouter.config,
        theme: AppTheme.light,
        title: AppConstants.name,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
