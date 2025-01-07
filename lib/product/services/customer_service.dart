import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/services/base_service.dart';

final class CustomerService extends BaseService {
  factory CustomerService() => _instance;
  CustomerService._();
  static final _instance = CustomerService._();

  late final customerCollection =
      db.collection(FirestoreCollections.customers.name).withConverter(
            toFirestore: Customer.toFirestore,
            fromFirestore: Customer.fromFirestore,
          );

  Future<void> addCustomer(Customer customer) async {
    await customerCollection.add(customer);
  }
}
