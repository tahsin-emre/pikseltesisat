// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkCartItem _$WorkCartItemFromJson(Map<String, dynamic> json) => WorkCartItem(
      id: json['id'] as String? ?? '',
      title: json['title'] as String?,
      price: json['price'] as num?,
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WorkCartItemToJson(WorkCartItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'count': instance.count,
    };
