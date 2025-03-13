import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pikseltesisat/product/services/customer_service.dart';
import 'package:pikseltesisat/product/services/personal_service.dart';
import 'package:pikseltesisat/product/services/work_service.dart';

/// Module for service related dependencies
@module
abstract class ServiceModule {
  /// Provides CustomerService instance
  @singleton
  CustomerService provideCustomerService(
    FirebaseFirestore firestore,
    FirebaseAuth firebaseAuth,
    FirebaseStorage firebaseStorage,
  ) =>
      CustomerService(
        firestore: firestore,
        firebaseAuth: firebaseAuth,
        firebaseStorage: firebaseStorage,
      );

  /// Provides PersonalService instance
  @singleton
  PersonalService providePersonalService(
    FirebaseFirestore firestore,
    FirebaseAuth firebaseAuth,
    FirebaseStorage firebaseStorage,
  ) =>
      PersonalService(
        firestore: firestore,
        firebaseAuth: firebaseAuth,
        firebaseStorage: firebaseStorage,
      );

  /// Provides WorkService instance
  @singleton
  WorkService provideWorkService(
    FirebaseFirestore firestore,
    FirebaseAuth firebaseAuth,
    FirebaseStorage firebaseStorage,
  ) =>
      WorkService(
        firestore: firestore,
        firebaseAuth: firebaseAuth,
        firebaseStorage: firebaseStorage,
      );
}
