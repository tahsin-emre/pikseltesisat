import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/customers/cubit/customer_state.dart';

final class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(const CustomerState());

  void getCustomers() {
    emit(state.copyWith(customerList: const []));
  }
}
