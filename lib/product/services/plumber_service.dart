import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/utils/enums/user_type.dart';

final class PlumberService extends BaseService {
  factory PlumberService() => _instance;
  PlumberService._();
  static final _instance = PlumberService._();

  late final plumberCollection =
      db.collection(FirestoreCollections.plumbers.name).withConverter(
            toFirestore: Plumber.toFirestore,
            fromFirestore: Plumber.fromFirestore,
          );

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

  Future<void> addPlumber(Plumber plumber) async {
    await plumberCollection.add(plumber);
  }

  Future<void> confirmPlumber(String userId) async {}
}
