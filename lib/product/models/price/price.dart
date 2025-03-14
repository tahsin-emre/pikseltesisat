import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable(explicitToJson: true)
final class Price extends Equatable {
  const Price({
    required this.id,
    this.name,
    this.recommendedPrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);

  final String id;
  final String? name;
  final num? recommendedPrice;

  Price copyWith({
    String? id,
    String? name,
    num? recommendedPrice,
  }) {
    return Price(
      id: id ?? this.id,
      name: name ?? this.name,
      recommendedPrice: recommendedPrice ?? this.recommendedPrice,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        recommendedPrice,
      ];
}
