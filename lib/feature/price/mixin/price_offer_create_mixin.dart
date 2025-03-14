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
    workCartNotifier.value = List.of(widget.workCart);
  }

  void updateList(WorkCartItem item) {
    final currentList = List.of(workCartNotifier.value);
    final exist = currentList.firstWhereOrNull((e) => e.id == item.id) != null;
    if (exist) {
      currentList.removeWhere((e) => e.id == item.id);
    }
    currentList.add(item);
    workCartNotifier.value = currentList;
  }

  void removeItem(String itemId) {
    final currentList = List.of(workCartNotifier.value)
      ..removeWhere((e) => e.id == itemId);
    workCartNotifier.value = currentList;
  }

  void clearItems() => _init();

  void createOffer() {
    final currentList = List.of(workCartNotifier.value);
    final tempList = List.of(currentList)
      ..removeWhere((e) => e.id == 'service');
    if (tempList.isEmpty) {
      Navigator.pop(context);
      return;
    }
    Navigator.pop(context, currentList);
  }
}
