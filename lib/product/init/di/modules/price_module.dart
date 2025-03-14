import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pikseltesisat/feature/price/cubit/price_cubit.dart';
import 'package:pikseltesisat/product/services/price_service.dart';

/// Module for price related dependencies
@module
abstract class PriceModule {
  /// Provides PriceService instance
  @singleton
  PriceService providePriceService(
    FirebaseFirestore firestore,
    FirebaseAuth firebaseAuth,
    FirebaseStorage firebaseStorage,
  ) =>
      PriceService(
        firestore: firestore,
        firebaseAuth: firebaseAuth,
        firebaseStorage: firebaseStorage,
      );

  /// Provides PriceCubit instance
  @singleton
  PriceCubit providePriceCubit(PriceService priceService) => PriceCubit(
        priceService: priceService,
      );
}
