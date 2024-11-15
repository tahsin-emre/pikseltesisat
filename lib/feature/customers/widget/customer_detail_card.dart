import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';

final class CustomerDetailCard extends StatelessWidget {
  const CustomerDetailCard(this.customer, {super.key});
  final Customer customer;
  @override
  Widget build(BuildContext context) {
    return Container(
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
