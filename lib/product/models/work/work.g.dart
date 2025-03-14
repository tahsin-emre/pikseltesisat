// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Work _$WorkFromJson(Map<String, dynamic> json) => Work(
      id: json['id'] as String? ?? '',
      description: json['description'] as String?,
      customerId: json['customerId'] as String?,
      personalId: json['personalId'] as String?,
      createdAt: FirebaseModelHelper.timestampToDateTime(
          json['createdAt'] as Timestamp),
      workDate: FirebaseModelHelper.timestampToDateTime(
          json['workDate'] as Timestamp),
      workStatus: $enumDecodeNullable(_$WorkStatusEnumMap, json['workStatus']),
      workType: $enumDecodeNullable(_$WorkTypeEnumMap, json['workType']),
      serviceType:
          $enumDecodeNullable(_$ServiceTypeEnumMap, json['serviceType']),
      workCartItems: (json['workCartItems'] as List<dynamic>?)
          ?.map((e) => WorkCartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkToJson(Work instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'customerId': instance.customerId,
      'personalId': instance.personalId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'workDate': instance.workDate?.toIso8601String(),
      'workStatus': _$WorkStatusEnumMap[instance.workStatus],
      'workType': _$WorkTypeEnumMap[instance.workType],
      'serviceType': _$ServiceTypeEnumMap[instance.serviceType],
      'workCartItems': instance.workCartItems,
    };

const _$WorkStatusEnumMap = {
  WorkStatus.none: 'none',
  WorkStatus.pending: 'pending',
  WorkStatus.completed: 'completed',
  WorkStatus.cancelled: 'cancelled',
  WorkStatus.other: 'other',
};

const _$WorkTypeEnumMap = {
  WorkType.none: 'none',
  WorkType.waterLeakage: 'waterLeakage',
  WorkType.unclogging: 'unclogging',
  WorkType.repair: 'repair',
  WorkType.washing: 'washing',
  WorkType.other: 'other',
};

const _$ServiceTypeEnumMap = {
  ServiceType.none: 0,
  ServiceType.service: 1,
  ServiceType.rework: 2,
  ServiceType.extra: 3,
  ServiceType.other: 4,
};
