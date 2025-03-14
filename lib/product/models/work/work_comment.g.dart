// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkComment _$WorkCommentFromJson(Map<String, dynamic> json) => WorkComment(
      id: json['id'] as String? ?? '',
      createdAt: FirebaseModelHelper.timestampToDateTime(
          json['createdAt'] as Timestamp?),
      comment: json['comment'] as String?,
      personalName: json['personalName'] as String?,
    );

Map<String, dynamic> _$WorkCommentToJson(WorkComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': FirebaseModelHelper.dateTimeToTimestamp(instance.createdAt),
      'comment': instance.comment,
      'personalName': instance.personalName,
    };
