import 'package:equatable/equatable.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';

final class CustomerState extends Equatable {
  const CustomerState({
    required this.customer,
    this.isLoading = false,
  });

  CustomerState copyWith({
    Customer? customer,
    bool? isLoading,
  }) {
    return CustomerState(
      customer: customer ?? this.customer,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  final Customer customer;
  final bool isLoading;

  @override
  List<Object?> get props => [customer, isLoading];
}
