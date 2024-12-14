import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/view/customer_detail_view.dart';

mixin CustomerDetailMixin on State<CustomerDetailView> {
  final loadingNotifier = ValueNotifier<bool>(false);
}
