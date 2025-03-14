import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/utils/enums/user_type.dart';

/// Authentication service for handling user authentication
class AuthService extends BaseService {
  /// Constructor with dependency injection
  AuthService({
    required FirebaseFirestore firestore,
    required FirebaseAuth firebaseAuth,
    required FirebaseStorage firebaseStorage,
  }) : super(
          db: firestore,
          auth: firebaseAuth,
          storage: firebaseStorage,
        );

  /// Login with email and password
  Future<String?> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on Exception catch (e) {
      return '${LocaleKeys.base_error.tr()} $e';
    }
  }

  /// Register with email and password
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

  /// Logout current user
  Future<void> logout() async {
    await auth.signOut();
  }

  /// Get current user data
  Future<MyUser?> getUser() async {
    final user = auth.currentUser;
    if (user == null) return null;
    final response = await userCollection.doc(user.uid).get();
    if (response.data() == null) return null;
    return response.data();
  }

  /// Create a new user in Firestore
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
