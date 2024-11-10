import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/services/base_service.dart';

final class CustomerService extends BaseService {
  factory CustomerService() => _instance;
  CustomerService._();
  static final _instance = CustomerService._();

  late final _collection =
      db.collection(FirestoreCollections.customers.name).withConverter(
            toFirestore: (customer, options) => customer.toMap(),
            fromFirestore: (snapshot, options) =>
                Customer.fromMap(snapshot.data()!).copyWith(id: snapshot.id),
          );

  Stream<QuerySnapshot<Customer>> get customerListStream =>
      _collection.snapshots();

  Future<String?> addCustomer(Customer customer) async {
    try {
      await _collection.add(customer);
      return null;
    } on Exception {
      return 'Failed to add customer';
    }
  }
}
