import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/mixin/customer_create_mixin.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/async_button.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/custom_phone_field.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/custom_text_field.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/district_selector.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class CustomerCreateView extends StatefulWidget {
  const CustomerCreateView({this.customer, super.key});
  final Customer? customer;

  @override
  State<CustomerCreateView> createState() => _CustomerCreateViewState();
}

class _CustomerCreateViewState extends State<CustomerCreateView>
    with CustomerCreateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: LocaleKeys.customer_newCustomer.tr()),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField(
              label: LocaleKeys.customer_name.tr(),
              controller: nameController,
            ),
            CustomTextField(
              label: LocaleKeys.customer_address.tr(),
              controller: addressController,
            ),
            Row(
              children: [
                DistrictSelector((val) => district = val).expanded,
                CustomPhoneField(controller: phoneController).expanded,
              ],
            ),
            AsyncButton(
              onTap: createCustomer,
              label: LocaleKeys.base_save.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
