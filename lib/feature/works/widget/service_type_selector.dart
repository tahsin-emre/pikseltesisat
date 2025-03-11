import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/enums/service_type.dart';

final class ServiceTypeSelector extends StatelessWidget {
  const ServiceTypeSelector(this.onChanged, {super.key});
  final ValueChanged<ServiceType?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allXS,
      child: DropdownButtonFormField(
        isExpanded: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: LocaleKeys.serviceType_serviceType.tr(),
          border: const OutlineInputBorder(),
        ),
        items: ServiceType.values
            .sublist(1)
            .map(
              (e) => DropdownMenuItem<ServiceType>(
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
  const _TypeRow(this.serviceType);
  final ServiceType serviceType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: serviceType.color,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        Text(serviceType.localeKey.tr()),
      ],
    );
  }
}
