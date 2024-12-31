import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class CustomerDetailCard extends StatelessWidget {
  const CustomerDetailCard(this.customer, {super.key});
  final Customer customer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allS,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(customer.name ?? ''),
              Text(customer.phone ?? ''),
              Text(customer.address ?? ''),
            ],
          ).expanded,
          IconButton.filled(
            onPressed: () {},
            icon: AppIcons.call.toIcon,
          ),
          IconButton.filled(
            onPressed: () {},
            icon: AppIcons.location.toIcon,
          ),
        ],
      ),
    );
  }
}
