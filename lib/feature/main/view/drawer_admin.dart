import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/main/widgets/drawer_widgets.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

final class AdminDrawer extends StatelessWidget {
  const AdminDrawer({required this.onClose, super.key});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppIcons.home.toCustomIcon(size: 100),
          DrawerTile(
            title: LocaleKeys.drawer_home.tr(),
            icon: AppIcons.home,
            onTap: () {
              // onClose();
              const DashboardRoute().go(context);
            },
          ),
          DrawerTile(
            title: LocaleKeys.drawer_customers.tr(),
            icon: AppIcons.customers,
            onTap: () {
              // onClose();
              const CustomerListRoute().go(context);
            },
          ),
          DrawerTile(
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
