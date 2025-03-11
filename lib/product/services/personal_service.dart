import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/utils/enums/user_type.dart';

final class PersonalService extends BaseService {
  factory PersonalService() => _instance;
  PersonalService._();
  static final _instance = PersonalService._();

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

  Future<Personal?> getPersonal(String id) async {
    final response = await personalCollection.doc(id).get();
    return response.data();
  }
}
