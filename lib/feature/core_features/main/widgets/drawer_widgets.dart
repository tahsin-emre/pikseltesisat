import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

final class DrawerTile extends StatelessWidget {
  const DrawerTile({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.drawer,
      title: Text(title),
      leading: icon.toIcon,
      onTap: onTap,
    );
  }
}

final class DrawerLogOut extends StatefulWidget {
  const DrawerLogOut({super.key});

  @override
  State<DrawerLogOut> createState() => _DrawerLogOutState();
}

class _DrawerLogOutState extends State<DrawerLogOut> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.drawer,
      title: Text(LocaleKeys.drawer_logout.tr()),
      leading: AppIcons.logout.toIcon,
      onTap: () async {
        await context.read<AuthCubit>().logout();
        goToSplash();
      },
    );
  }

  void goToSplash() {
    const SplashRoute().go(context);
  }
}
