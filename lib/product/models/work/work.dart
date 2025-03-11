import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pikseltesisat/product/utils/enums/service_type.dart';
import 'package:pikseltesisat/product/utils/enums/work_type.dart';
import 'package:pikseltesisat/product/utils/extensions/int_ext.dart';

final class Work extends Equatable {
  const Work({
    this.id = '',
    this.description,
    this.customerId,
    this.personalId,
    this.createdAt,
    this.workDate,
    this.workType,
    this.serviceType,
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
      personalId: map['personalId'] as String?,
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      workDate: (map['workDate'] as Timestamp?)?.toDate(),
      workType: (map['workType'] as int?)?.toWorkType,
      serviceType: (map['serviceType'] as int?)?.toServiceType,
    );
  }

  static Map<String, dynamic> toFirestore(Work work, SetOptions? _) {
    return {
      'description': work.description,
      'customerId': work.customerId,
      'personalId': work.personalId,
      'createdAt': work.createdAt,
      'workDate': work.workDate,
      'workType': work.workType?.index,
      'serviceType': work.serviceType?.index,
    };
  }

  Work copyWith({
    String? id,
    String? description,
    String? customerId,
    String? personalId,
    DateTime? createdAt,
    DateTime? workDate,
    WorkType? workType,
    ServiceType? serviceType,
  }) {
    return Work(
      id: id ?? this.id,
      description: description ?? this.description,
      customerId: customerId ?? this.customerId,
      personalId: personalId ?? this.personalId,
      createdAt: createdAt ?? this.createdAt,
      workDate: workDate ?? this.workDate,
      workType: workType ?? this.workType,
      serviceType: serviceType ?? this.serviceType,
    );
  }

  final String id;
  final String? description;
  final String? customerId;
  final String? personalId;
  final DateTime? createdAt;
  final DateTime? workDate;
  final WorkType? workType;
  final ServiceType? serviceType;

  @override
  List<Object?> get props => [
        id,
        description,
        customerId,
        personalId,
        createdAt,
        workDate,
        workType,
        serviceType,
      ];
}
