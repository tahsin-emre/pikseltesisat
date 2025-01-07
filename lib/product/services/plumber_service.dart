import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/utils/enums/user_type.dart';

final class PlumberService extends BaseService {
  factory PlumberService() => _instance;
  PlumberService._();
  static final _instance = PlumberService._();

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

  Future<String?> confirmPlumber(MyUser user) async {
    try {
      final newPlumber = Plumber(id: user.id, name: user.name);
      await plumberCollection.doc(user.id).set(newPlumber);
      await userCollection.doc(user.id).update({
        FirestoreFields.userType.name: UserType.plumber.index,
      });
      return null;
    } on Exception catch (e) {
      return e.toString();
    }
  }

  Future<Plumber?> getPlumber(String id) async {
    final response = await plumberCollection.doc(id).get();
    return response.data();
  }
}
