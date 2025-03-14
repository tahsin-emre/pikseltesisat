import 'package:equatable/equatable.dart';
import 'package:pikseltesisat/product/models/price/price.dart';

final class PriceState extends Equatable {
  const PriceState({this.prices});

  PriceState copyWith({
    List<Price>? prices,
  }) {
    return PriceState(
      prices: prices ?? this.prices,
    );
  }

  final List<Price>? prices;

  @override
  List<Object?> get props => [prices];
}
