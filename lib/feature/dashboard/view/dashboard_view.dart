import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/dashboard/widget/dashboard_card.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';

final class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashboardCard(
          label: LocaleKeys.drawer_customers.tr(),
          onTap: () => const CustomerListRoute().go(context),
        ),
        DashboardCard(
          label: LocaleKeys.drawer_plumbers.tr(),
          onTap: () => const PlumberListRoute().go(context),
        ),
      ],
    );
  }
}
