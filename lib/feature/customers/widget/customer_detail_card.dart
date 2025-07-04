import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Text(customer.district?.name ?? ''),
            ],
          ).expanded,
          IconButton.filled(
            onPressed: () {
              launchUrl(Uri.parse('tel:${customer.phone}'));
            },
            icon: AppIcons.call.toIcon,
          ),
          IconButton.filled(
            onPressed: () {
              final addressLine = customer.address ?? '';
              final district = customer.district?.name ?? '';
              final province = customer.province?.name ?? '';
              final address =
                  '$addressLine+$district+$province'.replaceAll(' ', '+');
              launchUrl(
                  Uri.parse('https://www.google.com/maps/place/$address'));
            },
            icon: AppIcons.location.toIcon,
          ),
        ],
      ),
    );
  }
}
