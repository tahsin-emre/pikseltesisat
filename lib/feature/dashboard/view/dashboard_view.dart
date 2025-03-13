import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/works/view/work_list_view.dart';

final class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkListView();
    // return CustomScrollView(
    //   slivers: [
    //     DashboardCard(
    //       label: LocaleKeys.drawer_customers.tr(),
    //       onTap: () => const CustomerListRoute().go(context),
    //     ).toSliver,
    //     DashboardCard(
    //       label: LocaleKeys.drawer_personals.tr(),
    //       onTap: () => const PersonalListRoute().go(context),
    //     ).toSliver,
    //     DashboardCard(
    //       label: LocaleKeys.drawer_works.tr(),
    //       onTap: () => const WorkListRoute().go(context),
    //     ).toSliver,
    //   ],
    // );
  }
}
