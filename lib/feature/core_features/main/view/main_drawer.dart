import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_state.dart';
import 'package:pikseltesisat/feature/core_features/main/widgets/drawer_profile.dart';
import 'package:pikseltesisat/feature/core_features/main/widgets/drawer_widgets.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/extensions/context_general_ext.dart';
import 'package:pikseltesisat/product/utils/extensions/my_user_ext.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState, MyUser?>(
      selector: (state) => state.user,
      bloc: locator<AuthCubit>(),
      builder: (_, user) {
        return ColoredBox(
          color: context.teska.colorScheme.onSecondary,
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                const DrawerProfile().toSliver,
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
                if (user.isAdmin)
                  DrawerTile(
                    title: LocaleKeys.drawer_customers.tr(),
                    icon: AppIcons.customers,
                    onTap: () => const CustomerListRoute().go(context),
                  ).toSliver,
                //Personals
                if (user.isAdmin)
                  DrawerTile(
                    title: LocaleKeys.drawer_personals.tr(),
                    icon: AppIcons.personals,
                    onTap: () => const PersonalListRoute().go(context),
                  ).toSliver,
                //Prices
                if (user.isAdmin)
                  DrawerTile(
                    title: LocaleKeys.drawer_prices.tr(),
                    icon: AppIcons.prices,
                    onTap: () => const PriceListRoute().go(context),
                  ).toSliver,
                //Reports
                if (user.isAdmin)
                  DrawerTile(
                    title: LocaleKeys.drawer_reports.tr(),
                    icon: AppIcons.report,
                    onTap: () {},
                  ).toSliver,
                const Divider().toSliver,
                const DrawerLogOut().toSliver,
              ],
            ),
          ),
        );
      },
    );
  }
}
