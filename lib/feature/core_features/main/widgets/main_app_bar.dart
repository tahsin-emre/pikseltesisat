import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

final class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    required this.onTap,
    super.key,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(LocaleKeys.appName.tr()),
      titleTextStyle: context.general.textTheme.titleLarge,
      notificationPredicate: (notification) => false,
      leading: IconButton(
        onPressed: onTap,
        icon: AppIcons.menu.toIcon,
      ),
      actions: [
        IconButton(
          onPressed: () => const SearchRoute().push<void>(context),
          icon: AppIcons.search.toIcon,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
