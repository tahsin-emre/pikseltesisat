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
          json['createdAt'] as Timestamp?),
      workDate: FirebaseModelHelper.timestampToDateTime(
          json['workDate'] as Timestamp?),
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
      'createdAt': FirebaseModelHelper.dateTimeToTimestamp(instance.createdAt),
      'workDate': FirebaseModelHelper.dateTimeToTimestamp(instance.workDate),
      'workStatus': _$WorkStatusEnumMap[instance.workStatus],
      'workType': _$WorkTypeEnumMap[instance.workType],
      'serviceType': _$ServiceTypeEnumMap[instance.serviceType],
      'workCartItems': instance.workCartItems,
    };

const _$WorkStatusEnumMap = {
  WorkStatus.none: 0,
  WorkStatus.pending: 1,
  WorkStatus.completed: 2,
  WorkStatus.cancelled: 3,
  WorkStatus.other: 4,
};

const _$WorkTypeEnumMap = {
  WorkType.none: 0,
  WorkType.waterLeakage: 1,
  WorkType.unclogging: 2,
  WorkType.repair: 3,
  WorkType.washing: 4,
  WorkType.other: 5,
};

const _$ServiceTypeEnumMap = {
  ServiceType.none: 0,
  ServiceType.service: 1,
  ServiceType.rework: 2,
  ServiceType.extra: 3,
  ServiceType.other: 4,
};
