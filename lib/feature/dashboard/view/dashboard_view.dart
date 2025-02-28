import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/dashboard/widget/dashboard_card.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        DashboardCard(
          label: LocaleKeys.drawer_customers.tr(),
          onTap: () => const CustomerListRoute().go(context),
        ).toSliver,
        DashboardCard(
          label: LocaleKeys.drawer_plumbers.tr(),
          onTap: () => const PlumberListRoute().go(context),
        ).toSliver,
        DashboardCard(
          label: LocaleKeys.drawer_works.tr(),
          onTap: () => const WorkListRoute().go(context),
        ).toSliver,
      ],
    );
  }
}
