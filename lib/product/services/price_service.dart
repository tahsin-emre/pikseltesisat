import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pikseltesisat/product/models/price/price.dart';
import 'package:pikseltesisat/product/services/base_service.dart';

/// Service for personal operations
class PriceService extends BaseService {
  /// Constructor with dependency injection
  PriceService({
    required FirebaseFirestore firestore,
    required FirebaseAuth firebaseAuth,
    required FirebaseStorage firebaseStorage,
  }) : super(
          db: firestore,
          auth: firebaseAuth,
          storage: firebaseStorage,
        );

  late final CollectionReference<Price> priceCollection =
      db.collection(FirestoreCollections.priceOffers.name).withConverter(
            fromFirestore: (snapshot, _) =>
                Price.fromJson(snapshot.data() ?? {}).copyWith(id: snapshot.id),
            toFirestore: (price, _) => price.toJson(),
          );
}
