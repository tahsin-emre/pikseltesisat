import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pikseltesisat/product/models/firebase_model_helper.dart';

part 'work_comment.g.dart';

@JsonSerializable()
final class WorkComment extends Equatable {
  const WorkComment({
    required this.id,
    this.createdAt,
    this.comment,
    this.personalName,
  });

  factory WorkComment.fromJson(Map<String, dynamic> json) =>
      _$WorkCommentFromJson(json);

  Map<String, dynamic> toJson() => _$WorkCommentToJson(this);

  WorkComment copyWith({
    String? id,
    DateTime? createdAt,
    String? comment,
    String? personalName,
  }) {
    return WorkComment(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      comment: comment ?? this.comment,
      personalName: personalName ?? this.personalName,
    );
  }

  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(
    fromJson: FirebaseModelHelper.timestampToDateTime,
    toJson: FirebaseModelHelper.dateTimeToTimestamp,
  )
  final DateTime? createdAt;
  final String? comment;
  final String? personalName;

  @override
  List<Object?> get props => [
        id,
        createdAt,
        comment,
        personalName,
      ];
}
