import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/extensions/context_general_ext.dart';

final class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    required this.onTap,
    super.key,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.teska.colorScheme.primary,
            context.teska.colorScheme.secondary,
          ],
        ),
      ),
      child: AppBar(
        title: Text(
          LocaleKeys.appName.tr(),
          style: context.teska.textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
        ),
        titleTextStyle: context.teska.textTheme.titleLarge,
        notificationPredicate: (notification) => false,
        leading: IconButton(
          onPressed: onTap,
          icon: AppIcons.menu.toCustomIcon(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => const SearchRoute().push<void>(context),
            icon: AppIcons.search.toCustomIcon(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
