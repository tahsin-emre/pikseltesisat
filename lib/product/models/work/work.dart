import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

final class Work extends Equatable {
  const Work({
    this.id = '',
    this.customerId,
    this.plumberId,
    this.createdAt,
    this.workDate,
  });

  factory Work.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final map = snapshot.data()!;
    return Work(
      id: snapshot.id,
      customerId: map['customerId'] as String?,
      plumberId: map['plumberId'] as String?,
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      workDate: (map['workDate'] as Timestamp?)?.toDate(),
    );
  }

  static Map<String, dynamic> toFirestore(Work work, SetOptions? _) {
    return {
      'customerId': work.customerId,
      'plumberId': work.plumberId,
      'createdAt': work.createdAt,
      'workDate': work.workDate,
    };
  }

  Work copyWith({
    String? id,
    String? customerId,
    String? plumberId,
    DateTime? createdAt,
    DateTime? workDate,
  }) {
    return Work(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      plumberId: plumberId ?? this.plumberId,
      createdAt: createdAt ?? this.createdAt,
      workDate: workDate ?? this.workDate,
    );
  }

  final String id;
  final String? customerId;
  final String? plumberId;
  final DateTime? createdAt;
  final DateTime? workDate;

  @override
  List<Object?> get props => [
        id,
        customerId,
        plumberId,
        createdAt,
        workDate,
      ];
}
