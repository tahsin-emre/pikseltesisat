import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

final class MainAppBar extends BaseAppBar {
  MainAppBar({
    required VoidCallback onTap,
    super.key,
  }) : super(
          title: LocaleKeys.appName.tr(),
          leading: IconButton(
            onPressed: onTap,
            icon: AppIcons.menu.toIcon,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: AppIcons.search.toIcon,
            ),
          ],
        );
}
