import 'package:equatable/equatable.dart';

final class WorkCartItem extends Equatable {
  const WorkCartItem({
    this.title,
    this.price,
    this.count,
  });

  factory WorkCartItem.fromMap(
    Map<String, dynamic> map,
  ) {
    return WorkCartItem(
      title: map['title'] as String?,
      price: map['price'] as num?,
      count: map['count'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'count': count,
    };
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
