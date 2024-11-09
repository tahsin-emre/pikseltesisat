import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/services/base_service.dart';

final class AuthService extends BaseService {
  Future<MyUser?> login({
    required String email,
    required String password,
  }) async {
    final credential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (credential.user == null) return null;
    final response = await db
        .collection(FirestoreCollections.users.name)
        .doc(credential.user!.uid)
        .get();
    if (response.data() == null) return null;
    final user = MyUser.fromMap(response.data()!);
    return user.copyWith(id: credential.user!.uid);
  }
}
