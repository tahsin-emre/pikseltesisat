import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/view/customer_detail_view.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/services/work_service.dart';

mixin CustomerDetailMixin on State<CustomerDetailView> {
  final WorkService _workService = locator<WorkService>();
  late final Customer customer = widget.customer;
  Query<Work>? query;

  @override
  void initState() {
    super.initState();
    setQuery();
  }

  void setQuery() {
    query = _workService.workCollection
        .where(
          FirestoreFields.customerId.name,
          isEqualTo: customer.id,
        )
        .orderBy(
          FirestoreFields.workDate.name,
          descending: true,
        );
  }
}
