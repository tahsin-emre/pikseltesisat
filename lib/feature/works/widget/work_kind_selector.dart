import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/enums/work_kind.dart';

final class WorkKindSelector extends StatelessWidget {
  const WorkKindSelector(this.onChanged, {super.key});
  final ValueChanged<WorkKind?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allXS,
      child: DropdownButtonFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: LocaleKeys.work_workKind.tr(),
          border: const OutlineInputBorder(),
        ),
        items: WorkKind.values
            .sublist(1)
            .map(
              (e) => DropdownMenuItem<WorkKind>(
                value: e,
                child: _KindRow(e),
              ),
            )
            .toList(),
      ),
    );
  }
}

final class _KindRow extends StatelessWidget {
  const _KindRow(this.workKind);
  final WorkKind workKind;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: workKind.color,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        Text(workKind.localeKey.tr()),
      ],
    );
  }
}
