import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';

final class CustomerDetailCard extends StatelessWidget {
  const CustomerDetailCard(this.customer, {super.key});
  final Customer customer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allS,
      child: Column(
        children: [
          Text(customer.name ?? ''),
          Text(customer.phone ?? ''),
          Text(customer.address ?? ''),
        ],
      ),
    );
  }
}
