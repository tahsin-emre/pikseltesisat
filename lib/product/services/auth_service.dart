import 'package:easy_localization/easy_localization.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/utils/enums/user_type.dart';

final class AuthService extends BaseService {
  factory AuthService() => _instance;
  AuthService._();
  static final _instance = AuthService._();

  late final userCollection =
      db.collection(FirestoreCollections.users.name).withConverter(
            fromFirestore: MyUser.fromFirestore,
            toFirestore: MyUser.toFirestore,
          );

  Future<String?> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on Exception catch (e) {
      return '${LocaleKeys.base_error.tr()} $e';
    }
  }

  Future<String?> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on Exception catch (e) {
      return '${LocaleKeys.base_error.tr()} $e';
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  Future<MyUser?> getUser() async {
    final user = auth.currentUser;
    if (user == null) return null;
    final response = await userCollection.doc(user.uid).get();
    if (response.data() == null) return null;
    return response.data();
  }

  Future<String?> createUser({required String name}) async {
    try {
      if (auth.currentUser == null) return LocaleKeys.base_error.tr();
      final user = MyUser(
        id: auth.currentUser!.uid,
        name: name,
        userType: UserType.waiting,
        createdAt: DateTime.now(),
      );
      await userCollection.doc(user.id).set(user);
      return null;
    } on Exception catch (e) {
      return '${LocaleKeys.base_error.tr()} $e';
    }
  }
}
