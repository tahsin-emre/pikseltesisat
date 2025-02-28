import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/widget/customer_selector.dart';
import 'package:pikseltesisat/feature/plumbers/widget/plumber_selector.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/async_button.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/custom_text_field.dart';
import 'package:pikseltesisat/feature/works/mixin/work_create_mixin.dart';
import 'package:pikseltesisat/feature/works/widget/work_date_selector.dart';
import 'package:pikseltesisat/feature/works/widget/work_kind_selector.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class WorkCreateView extends StatefulWidget {
  const WorkCreateView(this.work, {super.key});
  final Work? work;
  @override
  State<WorkCreateView> createState() => _WorkCreateViewState();
}

class _WorkCreateViewState extends State<WorkCreateView> with WorkCreateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allS,
      child: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            CustomTextField(
              label: LocaleKeys.work_workDetail.tr(),
              controller: descriptonController,
            ).toSliver,
            WorkDateSelector(
              onSelected: selectDate,
              initWorkDate: DateTime.now(),
            ).toSliver,
            if (customerId == null) CustomerSelector(selectCustomer).toSliver,
            PlumberSelector(selectPlumber).toSliver,
            WorkKindSelector(selectWorkKind).toSliver,
            AsyncButton(onTap: createWork, label: LocaleKeys.base_save.tr())
                .toSliver,
          ],
        ),
      ),
    );
  }
}
