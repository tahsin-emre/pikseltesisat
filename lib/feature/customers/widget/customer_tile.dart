import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

final class CustomerTile extends StatelessWidget {
  const CustomerTile({required this.customer, super.key});
  final Customer customer;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => CustomerDetailRoute(customer).push<void>(context),
      title: Text(customer.name ?? ''),
      subtitle: Text(customer.phone ?? ''),
      trailing: AppIcons.forward.toIcon,
    );
  }
}
