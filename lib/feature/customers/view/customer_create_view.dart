import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/mixin/customer_create_mixin.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/district_selector.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/custom_phone_field.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/custom_text_field.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
      body: ValueListenableBuilder(
        valueListenable: loadingNotifier,
        builder: (_, bool isLoading, __) {
          return Skeletonizer(
            enabled: isLoading,
            child: Form(
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
                      Expanded(
                        child: DistrictSelector((val) => district = val),
                      ),
                      Expanded(
                        child: CustomPhoneField(controller: phoneController),
                      ),
                    ],
                  ),
                  _CompleteButton(createCustomer),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

final class _CompleteButton extends StatelessWidget {
  const _CompleteButton(this.onTap);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(LocaleKeys.base_save.tr()),
    );
  }
}
