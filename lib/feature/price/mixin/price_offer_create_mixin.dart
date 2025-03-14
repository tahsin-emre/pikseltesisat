import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/price/cubit/price_cubit.dart';
import 'package:pikseltesisat/feature/price/view/price_offer_create_view.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/models/work/work_cart_item.dart';

mixin PriceOfferCreateMixin on State<PriceOfferCreateView> {
  final priceCubit = locator<PriceCubit>();

  final workCartNotifier = ValueNotifier<List<WorkCartItem>>([]);

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    workCartNotifier.value = widget.workCart;
  }

  String get amount {
    num total = 0;
    for (final item in workCartNotifier.value) {
      total += (item.price ?? 0) * (item.count ?? 0);
    }
    return total.toStringAsFixed(2);
  }

  void updateList(WorkCartItem item) {
    final currentList = workCartNotifier.value;
    final exist = currentList.firstWhereOrNull((e) => e.id == item.id) != null;
    if (exist) {
      currentList.removeWhere((e) => e.id == item.id);
    }
    currentList.add(item);
    workCartNotifier.value = currentList;
  }

  void removeItem(WorkCartItem item) {
    final currentList = workCartNotifier.value
      ..removeWhere((e) => e.id == item.id);
    workCartNotifier.value = currentList;
  }

  void clearItems() => _init();

  void createOffer() {}
}
