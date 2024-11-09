import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/product/init/router/app_router.dart';
import 'package:pikseltesisat/product/init/theme/app_theme.dart';
import 'package:pikseltesisat/product/utils/constants/app_constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
      ],
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
