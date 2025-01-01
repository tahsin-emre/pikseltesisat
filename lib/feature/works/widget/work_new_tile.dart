import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

final class WorkNewTile extends StatelessWidget {
  const WorkNewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => const WorkCreateRoute().push<void>(context),
        title: Text(LocaleKeys.work_newWork.tr()),
        leading: AppIcons.add.toIcon,
      ),
    );
  }
}
