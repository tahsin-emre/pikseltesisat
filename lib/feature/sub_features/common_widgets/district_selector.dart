import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/data/data_province_district.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/customer/district.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';

final class DistrictSelector extends StatelessWidget {
  const DistrictSelector(this.onChanged, {super.key});
  final ValueChanged<District?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allXS,
      child: DropdownButtonFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: LocaleKeys.customer_district.tr(),
          border: const OutlineInputBorder(),
        ),
        items: DataProvinceDistrict.districts
            .map(
              (e) => DropdownMenuItem<District>(
                value: e,
                child: Text(e.name),
              ),
            )
            .toList(),
      ),
    );
  }
}
