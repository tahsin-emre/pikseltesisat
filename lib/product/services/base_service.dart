import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/models/work/work.dart';

abstract class BaseService {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;

  final userCollection = FirebaseFirestore.instance
      .collection(FirestoreCollections.users.name)
      .withConverter(
        fromFirestore: MyUser.fromFirestore,
        toFirestore: MyUser.toFirestore,
      );

  final plumberCollection = FirebaseFirestore.instance
      .collection(FirestoreCollections.plumbers.name)
      .withConverter(
        fromFirestore: Plumber.fromFirestore,
        toFirestore: Plumber.toFirestore,
      );

  final customerCollection = FirebaseFirestore.instance
      .collection(FirestoreCollections.customers.name)
      .withConverter(
        toFirestore: Customer.toFirestore,
        fromFirestore: Customer.fromFirestore,
      );

  final workCollection = FirebaseFirestore.instance
      .collection(FirestoreCollections.works.name)
      .withConverter(
        toFirestore: Work.toFirestore,
        fromFirestore: Work.fromFirestore,
      );
}

enum FirestoreCollections {
  users,
  customers,
  plumbers,
  works,
  ;
}

enum FirestoreFields {
  createdAt,
  workDate,
  plumberId,
  customerId,
  workId,
  userType,
  ;
}
