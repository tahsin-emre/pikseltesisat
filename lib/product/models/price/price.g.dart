// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      id: json['id'] as String,
      name: json['name'] as String?,
      recommendedPrice: json['recommendedPrice'] as num?,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'recommendedPrice': instance.recommendedPrice,
    };
