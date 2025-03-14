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
      db.collection(FirestoreCollections.prices.name).withConverter(
            fromFirestore: (snapshot, _) =>
                Price.fromJson(snapshot.data() ?? {}).copyWith(id: snapshot.id),
            toFirestore: (price, _) => price.toJson(),
          );

  Future<List<Price>> getPrices() async {
    final snapshot = await priceCollection.get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  Future<String?> addPrice(Price price) async {
    final response = await priceCollection.add(price);
    return response.id;
  }

  Future<void> updatePrice(Price price) async {
    await priceCollection.doc(price.id).update(price.toJson());
  }

  Future<void> deletePrice(Price price) async {
    await priceCollection.doc(price.id).delete();
  }
}
