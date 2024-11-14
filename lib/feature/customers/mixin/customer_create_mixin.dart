import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:pikseltesisat/feature/customers/view/customer_create_view.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/customer/district.dart';
import 'package:pikseltesisat/product/services/customer_service.dart';
import 'package:pikseltesisat/product/utils/extensions/context_ext.dart';

mixin CustomerCreateMixin on State<CustomerCreateView> {
  final loadingNotifier = ValueNotifier<bool>(false);
  final _customerService = CustomerService();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = PhoneController(
    initialValue: const PhoneNumber(isoCode: IsoCode.TR, nsn: ''),
  );
  District? district;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    loadingNotifier.value = true;
    await Future.delayed(const Duration(milliseconds: 300), () {});
    loadingNotifier.value = false;
  }

  Future<void> createCustomer() async {
    // if (!formKey.currentState!.validate()) return;
    // loadingNotifier.value = true;
    final customer = Customer(
      name: nameController.text,
      phone: phoneController.value.international,
      address: addressController.text,
      district: district?.id,
      province: 34,
    );
    // final response = await _customerService.addCustomer(customer);
    // loadingNotifier.value = false;
    // if (response != null) {
    //   notifyUserError(response);
    //   return;
    // }
    // notifyUserAndPop();
    print(customer);
  }

  void notifyUserAndPop() {
    context.notify(LocaleKeys.customer_customerAdded.tr());
    Navigator.of(context).pop();
  }

  void notifyUserError(String message) {
    context.notify(message);
  }
}
