import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

part '../widgets/main_drawer_widgets.dart';

final class MainDrawer extends StatelessWidget {
  const MainDrawer({required this.onClose, super.key});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppIcons.home.toCustomIcon(size: 100),
          _DrawerTile(
            title: LocaleKeys.drawer_home.tr(),
            icon: AppIcons.home,
            onTap: () {
              // onClose();
              const HomeRoute().go(context);
            },
          ),
          _DrawerTile(
            title: LocaleKeys.drawer_customers.tr(),
            icon: AppIcons.customers,
            onTap: () {
              // onClose();
              const CustomerListRoute().go(context);
            },
          ),
          _DrawerTile(
            title: LocaleKeys.drawer_plumbers.tr(),
            icon: AppIcons.plumbers,
            onTap: () {
              // onClose();
              const PlumberListRoute().go(context);
            },
          ),
        ],
      ),
    );
  }
}
