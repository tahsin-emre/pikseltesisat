import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/product/services/auth_service.dart';

/// Module for auth related dependencies
@module
abstract class AuthModule {
  /// Provides AuthService instance
  @singleton
  AuthService provideAuthService(
    FirebaseFirestore firestore,
    FirebaseAuth firebaseAuth,
    FirebaseStorage firebaseStorage,
  ) =>
      AuthService(
        firestore: firestore,
        firebaseAuth: firebaseAuth,
        firebaseStorage: firebaseStorage,
      );

  /// Provides AuthCubit instance
  @singleton
  AuthCubit provideAuthCubit(AuthService authService) => AuthCubit(
        authService: authService,
      );
}
