import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

final class WorkComment extends Equatable {
  const WorkComment({
    this.id = '',
    this.createdAt,
    this.comment,
    this.personalName,
  });

  factory WorkComment.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final map = snapshot.data()!;
    return WorkComment(
      id: snapshot.id,
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      comment: map['comment'] as String?,
      personalName: map['personalName'] as String?,
    );
  }

  static Map<String, dynamic> toFirestore(
    WorkComment workComment,
    SetOptions? _,
  ) {
    return {
      'createdAt': workComment.createdAt,
      'comment': workComment.comment,
      'personalName': workComment.personalName,
    };
  }

  final String id;
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
