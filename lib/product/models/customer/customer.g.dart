// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as String? ?? '',
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      province: FirebaseModelHelper.provinceFromInt(
          (json['province'] as num?)?.toInt()),
      district: FirebaseModelHelper.districtFromInt(
          (json['district'] as num?)?.toInt()),
      searchIndex: (json['searchIndex'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: FirebaseModelHelper.timestampToDateTime(
          json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'searchIndex': instance.searchIndex,
      'province': FirebaseModelHelper.provinceToInt(instance.province),
      'district': FirebaseModelHelper.districtToInt(instance.district),
      'createdAt': FirebaseModelHelper.dateTimeToTimestamp(instance.createdAt),
    };
