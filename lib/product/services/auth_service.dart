import 'package:easy_localization/easy_localization.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/services/base_service.dart';

final class AuthService extends BaseService {
  factory AuthService() => _instance;
  AuthService._();
  static final _instance = AuthService._();

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
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
    final response = await db
        .collection(FirestoreCollections.users.name)
        .doc(user.uid)
        .get();
    if (response.data() == null) return null;
    final myUser = MyUser.fromMap(response.data()!);
    return myUser.copyWith(id: user.uid);
  }
}
