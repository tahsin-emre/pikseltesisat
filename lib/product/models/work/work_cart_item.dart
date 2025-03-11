import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

final class WorkCartItem extends Equatable {
  const WorkCartItem({
    this.id = '',
    this.title,
    this.price,
    this.count,
  });

  factory WorkCartItem.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final map = snapshot.data()!;
    return WorkCartItem(
      id: snapshot.id,
      title: map['title'] as String?,
      price: map['price'] as num?,
      count: map['count'] as int?,
    );
  }

  static Map<String, dynamic> toFirestore(
    WorkCartItem workCartItem,
    SetOptions? _,
  ) {
    return {
      'title': workCartItem.title,
      'price': workCartItem.price,
      'count': workCartItem.count,
    };
  }

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
