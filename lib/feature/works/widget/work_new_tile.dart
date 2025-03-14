import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

final class WorkNewTile extends StatelessWidget {
  const WorkNewTile({this.customerId, super.key});
  final String? customerId;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => WorkCreateRoute(Work(id: '', customerId: customerId))
            .push<void>(context),
        title: Text(LocaleKeys.work_newWork.tr()),
        leading: AppIcons.add.toIcon,
      ),
    );
  }
}
