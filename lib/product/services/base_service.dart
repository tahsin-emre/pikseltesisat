import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/models/work/work_comment.dart';

/// Base service class for all services
abstract class BaseService {
  /// Constructor with dependency injection
  BaseService({
    required this.db,
    required this.auth,
    required this.storage,
  });

  /// Firestore database instance
  final FirebaseFirestore db;

  /// Firebase auth instance
  final FirebaseAuth auth;

  /// Firebase storage instance
  final FirebaseStorage storage;

  /// User collection reference
  late final userCollection = db
      .collection(FirestoreCollections.users.name)
      .withConverter(
        fromFirestore: (snapshot, _) =>
            MyUser.fromJson(snapshot.data() ?? {}).copyWith(id: snapshot.id),
        toFirestore: (myUser, _) => myUser.toJson(),
      );

  /// Personal collection reference
  late final personalCollection = db
      .collection(FirestoreCollections.personals.name)
      .withConverter(
        fromFirestore: (snapshot, _) =>
            Personal.fromJson(snapshot.data() ?? {}).copyWith(id: snapshot.id),
        toFirestore: (personal, _) => personal.toJson(),
      );

  /// Customer collection reference
  late final customerCollection = db
      .collection(FirestoreCollections.customers.name)
      .withConverter(
        fromFirestore: (snapshot, _) =>
            Customer.fromJson(snapshot.data() ?? {}).copyWith(id: snapshot.id),
        toFirestore: (customer, _) => customer.toJson(),
      );

  /// Work collection reference
  late final workCollection =
      db.collection(FirestoreCollections.works.name).withConverter(
            fromFirestore: (snapshot, _) =>
                Work.fromJson(snapshot.data() ?? {}).copyWith(id: snapshot.id),
            toFirestore: (work, _) => work.toJson(),
          );

  /// Get comment collection reference for a work
  CollectionReference<WorkComment> getCommentCollection(String workId) {
    return workCollection
        .doc(workId)
        .collection(FirestoreCollections.comments.name)
        .withConverter(
          fromFirestore: (snapshot, _) =>
              WorkComment.fromJson(snapshot.data() ?? {})
                  .copyWith(id: snapshot.id),
          toFirestore: (workComment, _) => workComment.toJson(),
        );
  }
}

/// Firestore collection names
enum FirestoreCollections {
  /// Users collection
  users,

  /// Customers collection
  customers,

  /// Personals collection
  personals,

  /// Works collection
  works,

  /// Comments collection
  comments,
  ;
}

/// Firestore field names
enum FirestoreFields {
  /// Created at timestamp field
  createdAt,

  /// Work date field
  workDate,

  /// Personal ID field
  personalId,

  /// Customer ID field
  customerId,

  /// Work ID field
  workId,

  /// User type field
  userType,

  /// Search index field
  searchIndex,
  ;
}
