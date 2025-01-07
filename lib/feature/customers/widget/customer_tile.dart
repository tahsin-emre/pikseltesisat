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
      onTap: () => CustomerDetailRoute(customer).go(context),
      title: Text(customer.name ?? ''),
      subtitle: Text(subtitle),
      trailing: AppIcons.forward.toIcon,
    );
  }

  String get subtitle =>
      '${customer.address ?? ''}\n${customer.district?.name ?? ''}';
}
