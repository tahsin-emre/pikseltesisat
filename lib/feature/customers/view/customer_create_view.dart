import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';

final class CustomerCreateView extends StatefulWidget {
  const CustomerCreateView({this.customer, super.key});
  final Customer? customer;

  @override
  State<CustomerCreateView> createState() => _CustomerCreateViewState();
}

class _CustomerCreateViewState extends State<CustomerCreateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: LocaleKeys.customer_newCustomer.tr(),
      ),
      body: const Center(
        child: Text('CustomerCreateView'),
      ),
    );
  }
}
