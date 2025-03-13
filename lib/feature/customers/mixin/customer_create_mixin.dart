import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:pikseltesisat/feature/customers/view/customer_create_view.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/methods/toast.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/customer/district.dart';
import 'package:pikseltesisat/product/services/customer_service.dart';

mixin CustomerCreateMixin on State<CustomerCreateView> {
  final _customerService = locator<CustomerService>();
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
  }

  Future<void> createCustomer() async {
    if (!formKey.currentState!.validate()) return;
    final customer = Customer(
      name: nameController.text,
      phone: phoneController.value.international,
      address: addressController.text,
      district: district,
      province: 34,
      createdAt: DateTime.now(),
    );
    await _customerService.addCustomer(customer);
    notifyUserAndPop();
  }

  void notifyUserAndPop() {
    toast(LocaleKeys.customer_customerAdded.tr());
    const CustomerListRoute().go(context);
  }
}
