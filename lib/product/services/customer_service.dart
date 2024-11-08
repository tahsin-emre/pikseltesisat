import 'package:pikseltesisat/product/services/base_service.dart';

final class CustomerService extends BaseService {
  factory CustomerService() => _instance;
  CustomerService._();
  static final CustomerService _instance = CustomerService._();
}
