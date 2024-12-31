import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/view/customer_detail_view.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/services/work_service.dart';

mixin CustomerDetailMixin on State<CustomerDetailView> {
  late final Query<Work> query;
  final _workService = WorkService();
  final loadingNotifier = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    initQuery();
    changeLoading();
  }

  void initQuery() {
    query = _workService.workCollection
        .where(
          FirestoreFields.customerId.name,
          isEqualTo: widget.customer.id,
        )
        .orderBy(
          FirestoreFields.workDate.name,
          descending: true,
        );
  }

  void changeLoading() => loadingNotifier.value = !loadingNotifier.value;
}
