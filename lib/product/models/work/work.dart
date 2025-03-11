import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pikseltesisat/product/utils/enums/work_type.dart';
import 'package:pikseltesisat/product/utils/extensions/int_ext.dart';

final class Work extends Equatable {
  const Work({
    this.id = '',
    this.description,
    this.customerId,
    this.plumberId,
    this.createdAt,
    this.workDate,
    this.workType,
  });

  factory Work.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final map = snapshot.data()!;
    return Work(
      id: snapshot.id,
      description: map['description'] as String?,
      customerId: map['customerId'] as String?,
      plumberId: map['plumberId'] as String?,
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      workDate: (map['workDate'] as Timestamp?)?.toDate(),
      workType: (map['workType'] as int?)?.toWorkType,
    );
  }

  static Map<String, dynamic> toFirestore(Work work, SetOptions? _) {
    return {
      'description': work.description,
      'customerId': work.customerId,
      'plumberId': work.plumberId,
      'createdAt': work.createdAt,
      'workDate': work.workDate,
      'workKind': work.workType?.index,
    };
  }

  Work copyWith({
    String? id,
    String? description,
    String? customerId,
    String? plumberId,
    DateTime? createdAt,
    DateTime? workDate,
    WorkType? workType,
  }) {
    return Work(
      id: id ?? this.id,
      description: description ?? this.description,
      customerId: customerId ?? this.customerId,
      plumberId: plumberId ?? this.plumberId,
      createdAt: createdAt ?? this.createdAt,
      workDate: workDate ?? this.workDate,
      workType: workType ?? this.workType,
    );
  }

  final String id;
  final String? description;
  final String? customerId;
  final String? plumberId;
  final DateTime? createdAt;
  final DateTime? workDate;
  final WorkType? workType;

  @override
  List<Object?> get props => [
        id,
        description,
        customerId,
        plumberId,
        createdAt,
        workDate,
        workType,
      ];
}
