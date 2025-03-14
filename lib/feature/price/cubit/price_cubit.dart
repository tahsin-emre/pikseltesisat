import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/price/cubit/price_state.dart';
import 'package:pikseltesisat/product/models/price/price.dart';
import 'package:pikseltesisat/product/services/price_service.dart';

final class PriceCubit extends Cubit<PriceState> {
  PriceCubit({
    required PriceService priceService,
  })  : _priceService = priceService,
        super(const PriceState());

  final PriceService _priceService;

  Future<void> getPrices() async {
    final prices = await _priceService.getPrices();
    emit(state.copyWith(prices: prices));
  }

  Future<void> addPrice(Price price) async {
    final id = await _priceService.addPrice(price);
    if (id == null) return;
    emit(state.copyWith(prices: [...?state.prices, price.copyWith(id: id)]));
  }

  Future<void> updatePrice(Price price) async {
    await _priceService.updatePrice(price);
    emit(state.copyWith(prices: [...?state.prices, price]));
  }

  Future<void> deletePrice(Price price) async {
    await _priceService.deletePrice(price);
    emit(
      state.copyWith(
        prices: state.prices?.where((e) => e.id != price.id).toList(),
      ),
    );
  }
}
