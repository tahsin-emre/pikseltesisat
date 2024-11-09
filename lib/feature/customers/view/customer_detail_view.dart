import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';

final class CustomerDetailView extends StatefulWidget {
  const CustomerDetailView({required this.customer, super.key});
  final Customer customer;
  @override
  State<CustomerDetailView> createState() => _CustomerDetailViewState();
}

class _CustomerDetailViewState extends State<CustomerDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: widget.customer.name ?? ''),
      body: Center(
        child: Text(
          widget.customer.toMap().toString().replaceAll(',', '\n'),
        ),
      ),
    );
  }
}
