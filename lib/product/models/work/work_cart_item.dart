import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_cart_item.g.dart';

@JsonSerializable()
final class WorkCartItem extends Equatable {
  const WorkCartItem({
    this.title,
    this.price,
    this.count,
  });

  factory WorkCartItem.fromJson(Map<String, dynamic> json) =>
      _$WorkCartItemFromJson(json);

  Map<String, dynamic> toJson() => _$WorkCartItemToJson(this);

  WorkCartItem copyWith({
    String? title,
    num? price,
    int? count,
  }) {
    return WorkCartItem(
      title: title ?? this.title,
      price: price ?? this.price,
      count: count ?? this.count,
    );
  }

  final String? title;
  final num? price;
  final int? count;

  @override
  List<Object?> get props => [
        title,
        price,
        count,
      ];
}
