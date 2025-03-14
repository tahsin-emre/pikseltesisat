import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

/// Module for Firebase related dependencies
@module
abstract class FirebaseModule {
  /// Provides FirebaseFirestore instance
  @singleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  /// Provides FirebaseAuth instance
  @singleton
  FirebaseAuth get auth => FirebaseAuth.instance;

  /// Provides FirebaseStorage instance
  @singleton
  FirebaseStorage get storage => FirebaseStorage.instance;
}
