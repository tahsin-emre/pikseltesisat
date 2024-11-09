import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';

final class CustomerTile extends StatelessWidget {
  const CustomerTile({required this.customer, super.key});
  final Customer customer;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(customer.name ?? ''),
      subtitle: Text(customer.phone ?? ''),
    );
  }
}
