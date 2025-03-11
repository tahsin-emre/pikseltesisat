import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/enums/work_type.dart';

final class WorkTypeSelector extends StatelessWidget {
  const WorkTypeSelector(this.onChanged, {super.key});
  final ValueChanged<WorkType?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allXS,
      child: DropdownButtonFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: LocaleKeys.workType_workType.tr(),
          border: const OutlineInputBorder(),
        ),
        items: WorkType.values
            .sublist(1)
            .map(
              (e) => DropdownMenuItem<WorkType>(
                value: e,
                child: _TypeRow(e),
              ),
            )
            .toList(),
      ),
    );
  }
}

final class _TypeRow extends StatelessWidget {
  const _TypeRow(this.workType);
  final WorkType workType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: workType.color,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        Text(workType.localeKey.tr()),
      ],
    );
  }
}
