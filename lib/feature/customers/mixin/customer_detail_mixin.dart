import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/view/customer_detail_view.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/services/work_service.dart';

mixin CustomerDetailMixin on State<CustomerDetailView> {
  final _workService = WorkService();
  late final query = _workService.workCollection
      .where(
        FirestoreFields.customerId.name,
        isEqualTo: widget.customer.id,
      )
      .orderBy(
        FirestoreFields.workDate.name,
        descending: true,
      );

  @override
  void initState() {
    super.initState();
  }
}
