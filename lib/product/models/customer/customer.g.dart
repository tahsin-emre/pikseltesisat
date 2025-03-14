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
      province: (json['province'] as num?)?.toInt(),
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      searchIndex: (json['searchIndex'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: FirebaseModelHelper.timestampToDateTime(
          json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'province': instance.province,
      'district': instance.district,
      'searchIndex': instance.searchIndex,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
