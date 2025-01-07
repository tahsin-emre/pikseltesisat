import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({required this.controller, super.key});
  final PhoneController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allXS,
      child: PhoneFormField(
        controller: controller,
        isCountrySelectionEnabled: false,
        countryButtonStyle: const CountryButtonStyle(
          showFlag: false,
          showDropdownIcon: false,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: LocaleKeys.customer_phone.tr(),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
