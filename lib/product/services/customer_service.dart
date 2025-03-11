import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/utils/extensions/string_ext.dart';

final class CustomerService extends BaseService {
  factory CustomerService() => _instance;
  CustomerService._();
  static final _instance = CustomerService._();

  Future<void> addCustomer(Customer customer) async {
    final request = customer.copyWith(
      searchIndex: '${customer.name}${customer.phone}${customer.address}'
          .generateSearchIndex,
    );
    await customerCollection.add(request);
  }

  Future<Customer?> getCustomer(String id) async {
    final response = await customerCollection.doc(id).get();
    return response.data();
  }
}
