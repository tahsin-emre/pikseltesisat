import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/price/cubit/price_cubit.dart';
import 'package:pikseltesisat/feature/price/view/price_list_view.dart';
import 'package:pikseltesisat/feature/price/widget/new_price_alert.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/models/price/price.dart';

mixin PriceListMixin on State<PriceListView> {
  final priceCubit = locator<PriceCubit>();
  Future<void> onTap() async {
    final newPrice = await showDialog<Price?>(
      context: context,
      builder: (context) => const NewPriceAlert(),
    );
    if (newPrice == null) return;
    await priceCubit.addPrice(newPrice);
  }
}
