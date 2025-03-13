import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/utils/enums/user_type.dart';

/// Service for personal operations
class PersonalService extends BaseService {
  /// Constructor with dependency injection
  PersonalService({
    required FirebaseFirestore firestore,
    required FirebaseAuth firebaseAuth,
    required FirebaseStorage firebaseStorage,
  }) : super(
          db: firestore,
          auth: firebaseAuth,
          storage: firebaseStorage,
        );

  /// Get waiting users collection
  late final Query<MyUser> waitingCollection = db
      .collection(FirestoreCollections.users.name)
      .withConverter(
        fromFirestore: MyUser.fromFirestore,
        toFirestore: MyUser.toFirestore,
      )
      .where(
        FirestoreFields.userType.name,
        isEqualTo: UserType.waiting.index,
      );

  /// Confirm a waiting user as personal
  Future<String?> confirmPersonal(MyUser user) async {
    try {
      final newPersonal = Personal(id: user.id, name: user.name);
      await personalCollection.doc(user.id).set(newPersonal);
      await userCollection.doc(user.id).update({
        FirestoreFields.userType.name: UserType.personal.index,
      });
      return null;
    } on Exception catch (e) {
      return e.toString();
    }
  }

  /// Get personal by id
  Future<Personal?> getPersonal(String id) async {
    final response = await personalCollection.doc(id).get();
    return response.data();
  }
}
