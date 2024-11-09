import 'package:equatable/equatable.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';

final class CustomerState extends Equatable {
  const CustomerState({this.customerList});

  CustomerState copyWith({List<Customer>? customerList}) {
    return CustomerState(customerList: customerList ?? this.customerList);
  }

  final List<Customer>? customerList;

  @override
  List<Object?> get props => [customerList];
}
