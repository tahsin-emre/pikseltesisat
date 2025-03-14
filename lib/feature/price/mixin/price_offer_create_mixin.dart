import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/price/cubit/price_cubit.dart';
import 'package:pikseltesisat/feature/price/view/price_offer_create_view.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';

mixin PriceOfferCreateMixin on State<PriceOfferCreateView> {
  final priceCubit = locator<PriceCubit>();

  final amountNotifier = ValueNotifier<num>(0);

  void createOffer() {}
}
