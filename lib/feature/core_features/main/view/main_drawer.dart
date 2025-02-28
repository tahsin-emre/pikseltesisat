import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/core_features/main/widgets/drawer_widgets.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          AppIcons.home.toCustomIcon(size: AppSizes.maxiM).toSliver,
          const Divider().toSliver,
          //Dashboard
          DrawerTile(
            title: LocaleKeys.drawer_home.tr(),
            icon: AppIcons.home,
            onTap: () => const DashboardRoute().go(context),
          ).toSliver,
          //Works
          DrawerTile(
            title: LocaleKeys.drawer_works.tr(),
            icon: AppIcons.works,
            onTap: () => const WorkListRoute().go(context),
          ).toSliver,
          //Customers
          DrawerTile(
            title: LocaleKeys.drawer_customers.tr(),
            icon: AppIcons.customers,
            onTap: () => const CustomerListRoute().go(context),
          ).toSliver,
          //Plumbers
          DrawerTile(
            title: LocaleKeys.drawer_plumbers.tr(),
            icon: AppIcons.plumbers,
            onTap: () => const PlumberListRoute().go(context),
          ).toSliver,
          //Reports
          DrawerTile(
            title: LocaleKeys.drawer_reports.tr(),
            icon: AppIcons.report,
            onTap: () {},
          ).toSliver,
          const Divider().toSliver,
          const DrawerLogOut().toSliver,
        ],
      ),
    );
  }
}
