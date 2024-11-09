import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

part '../widgets/main_drawer_widgets.dart';

final class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppIcons.home.toCustomIcon(size: 100),
          _DrawerTile(
            title: LocaleKeys.drawer_home.tr(),
            icon: AppIcons.home,
            onTap: () {},
          ),
          _DrawerTile(
            title: LocaleKeys.drawer_customers.tr(),
            icon: AppIcons.customers,
            onTap: () {},
          ),
          _DrawerTile(
            title: LocaleKeys.drawer_plumbers.tr(),
            icon: AppIcons.plumbers,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
