import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/work/work_cart_item.dart';

final class WorkPriceDetailsAlert extends StatelessWidget {
  const WorkPriceDetailsAlert({required this.workCartItems, super.key});
  final List<WorkCartItem> workCartItems;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.workPriceOffer_title.tr()),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${LocaleKeys.work_totalPrice.tr()} : $totalPrice ₺'),
          ...workCartItems.map((e) => _CartItem(workCartItem: e)),
        ],
      ),
    );
  }

  String get totalPrice {
    num total = 0;
    for (final item in workCartItems) {
      total += (item.price ?? 0) * (item.count ?? 0);
    }
    return total.toStringAsFixed(2);
  }
}

final class _CartItem extends StatelessWidget {
  const _CartItem({required this.workCartItem});
  final WorkCartItem workCartItem;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(workCartItem.title ?? ''),
      subtitle: Text(workCartItem.price?.toStringAsFixed(2) ?? ''),
      trailing: Text(workCartItem.count.toString()),
    );
  }
}
