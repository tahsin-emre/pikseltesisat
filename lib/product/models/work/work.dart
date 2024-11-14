import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

final class Work extends Equatable {
  const Work({
    this.id = '',
    this.customerId,
    this.createdAt,
    this.workDate,
  });

  factory Work.fromMap(Map<String, dynamic> map) {
    return Work(
      customerId: map['customerId'] as String?,
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      workDate: (map['workDate'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'createdAt': createdAt,
      'workDate': workDate,
    };
  }

  Work copyWith({
    String? id,
    String? customerId,
    DateTime? createdAt,
    DateTime? workDate,
  }) {
    return Work(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      createdAt: createdAt ?? this.createdAt,
      workDate: workDate ?? this.workDate,
    );
  }

  final String id;
  final String? customerId;
  final DateTime? createdAt;
  final DateTime? workDate;

  @override
  List<Object?> get props => [
        id,
        customerId,
        createdAt,
        workDate,
      ];
}
