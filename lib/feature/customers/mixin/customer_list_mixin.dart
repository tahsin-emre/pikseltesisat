import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:pikseltesisat/feature/customers/view/customer_list_view.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/services/customer_service.dart';

mixin CustomerListMixin on State<CustomerListView> {
  final CustomerService _customerService = locator<CustomerService>();

  Query<Customer> get customerStream => _customerService.customerCollection
      .orderBy(FirestoreFields.createdAt.name, descending: true)
      .limit(5);
}
