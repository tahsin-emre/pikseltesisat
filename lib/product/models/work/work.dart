import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pikseltesisat/product/models/firebase_model_helper.dart';
import 'package:pikseltesisat/product/models/work/work_cart_item.dart';
import 'package:pikseltesisat/product/utils/enums/service_type.dart';
import 'package:pikseltesisat/product/utils/enums/work_status.dart';
import 'package:pikseltesisat/product/utils/enums/work_type.dart';

part 'work.g.dart';

@JsonSerializable()
final class Work extends Equatable {
  const Work({
    required this.id,
    this.description,
    this.customerId,
    this.personalId,
    this.createdAt,
    this.workDate,
    this.workStatus,
    this.workType,
    this.serviceType,
    this.workCartItems,
  });

  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);

  Map<String, dynamic> toJson() => _$WorkToJson(this);

  Work copyWith({
    String? id,
    String? description,
    String? customerId,
    String? personalId,
    DateTime? createdAt,
    DateTime? workDate,
    WorkStatus? workStatus,
    WorkType? workType,
    ServiceType? serviceType,
    List<WorkCartItem>? workCartItems,
  }) {
    return Work(
      id: id ?? this.id,
      description: description ?? this.description,
      customerId: customerId ?? this.customerId,
      personalId: personalId ?? this.personalId,
      createdAt: createdAt ?? this.createdAt,
      workDate: workDate ?? this.workDate,
      workStatus: workStatus ?? this.workStatus,
      workType: workType ?? this.workType,
      serviceType: serviceType ?? this.serviceType,
      workCartItems: workCartItems ?? this.workCartItems,
    );
  }

  @JsonKey(defaultValue: '')
  final String id;
  final String? description;
  final String? customerId;
  final String? personalId;
  @JsonKey(
    fromJson: FirebaseModelHelper.timestampToDateTime,
    toJson: FirebaseModelHelper.dateTimeToTimestamp,
  )
  final DateTime? createdAt;
  @JsonKey(
    fromJson: FirebaseModelHelper.timestampToDateTime,
    toJson: FirebaseModelHelper.dateTimeToTimestamp,
  )
  final DateTime? workDate;
  final WorkStatus? workStatus;
  final WorkType? workType;
  final ServiceType? serviceType;
  final List<WorkCartItem>? workCartItems;

  @override
  List<Object?> get props => [
        id,
        description,
        customerId,
        personalId,
        createdAt,
        workDate,
        workStatus,
        workType,
        serviceType,
        workCartItems,
      ];
}
