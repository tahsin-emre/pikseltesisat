import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_cart_item.g.dart';

@JsonSerializable(explicitToJson: true)
final class WorkCartItem extends Equatable {
  const WorkCartItem({
    required this.id,
    this.title,
    this.price,
    this.count,
  });

  factory WorkCartItem.fromJson(Map<String, dynamic> json) =>
      _$WorkCartItemFromJson(json);

  Map<String, dynamic> toJson() => _$WorkCartItemToJson(this);

  WorkCartItem copyWith({
    String? id,
    String? title,
    num? price,
    int? count,
  }) {
    return WorkCartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      count: count ?? this.count,
    );
  }

  @JsonKey(defaultValue: '')
  final String id;
  final String? title;
  final num? price;
  final int? count;

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        count,
      ];
}
