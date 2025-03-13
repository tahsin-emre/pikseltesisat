import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/utils/extensions/string_ext.dart';

/// Service for customer operations
class CustomerService extends BaseService {
  /// Constructor with dependency injection
  CustomerService({
    required FirebaseFirestore firestore,
    required FirebaseAuth firebaseAuth,
    required FirebaseStorage firebaseStorage,
  }) : super(
          db: firestore,
          auth: firebaseAuth,
          storage: firebaseStorage,
        );

  /// Add a new customer
  Future<void> addCustomer(Customer customer) async {
    final request = customer.copyWith(
      searchIndex: '${customer.name}${customer.phone}${customer.address}'
          .generateSearchIndex,
    );
    await customerCollection.add(request);
  }

  /// Get customer by id
  Future<Customer?> getCustomer(String id) async {
    final response = await customerCollection.doc(id).get();
    return response.data();
  }
}
