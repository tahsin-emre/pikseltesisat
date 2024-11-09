import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/customers/cubit/customer_state.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';

final class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit(Customer customer) : super(CustomerState(customer: customer));

  void fetchData() {
    emit(state.copyWith(isLoading: true));
    // Fetch data from API
    emit(state.copyWith(isLoading: false));
  }
}
