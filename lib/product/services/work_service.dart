import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/models/work/work_comment.dart';
import 'package:pikseltesisat/product/services/base_service.dart';

/// Service for work operations
class WorkService extends BaseService {
  /// Constructor with dependency injection
  WorkService({
    required FirebaseFirestore firestore,
    required FirebaseAuth firebaseAuth,
    required FirebaseStorage firebaseStorage,
  }) : super(
          db: firestore,
          auth: firebaseAuth,
          storage: firebaseStorage,
        );

  /// Add a new work
  Future<void> addWork(Work work) async {
    await workCollection.add(work);
  }

  /// Add a comment to a work
  Future<void> addComment(String workId, WorkComment comment) async {
    await getCommentCollection(workId).add(comment);
  }

  /// Get comments for a work
  Future<List<WorkComment>> getComments(String workId) async {
    final snapshot = await getCommentCollection(workId).get();
    return snapshot.docs.map((e) => e.data()).toList();
  }
}
