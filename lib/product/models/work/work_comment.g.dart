// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkComment _$WorkCommentFromJson(Map<String, dynamic> json) => WorkComment(
      id: json['id'] as String? ?? '',
      createdAt: FirebaseModelHelper.timestampToDateTime(
          json['createdAt'] as Timestamp),
      comment: json['comment'] as String?,
      personalName: json['personalName'] as String?,
    );

Map<String, dynamic> _$WorkCommentToJson(WorkComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'comment': instance.comment,
      'personalName': instance.personalName,
    };
