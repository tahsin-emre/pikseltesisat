// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyUser _$MyUserFromJson(Map<String, dynamic> json) => MyUser(
      id: json['id'] as String? ?? '',
      name: json['name'] as String?,
      createdAt: FirebaseModelHelper.timestampToDateTime(
          json['createdAt'] as Timestamp?),
      userType: $enumDecodeNullable(_$UserTypeEnumMap, json['userType']) ??
          UserType.none,
    );

Map<String, dynamic> _$MyUserToJson(MyUser instance) => <String, dynamic>{
      'id': instance.id,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'name': instance.name,
      'createdAt': FirebaseModelHelper.dateTimeToTimestamp(instance.createdAt),
    };

const _$UserTypeEnumMap = {
  UserType.none: 0,
  UserType.admin: 1,
  UserType.personal: 2,
  UserType.waiting: 3,
};
