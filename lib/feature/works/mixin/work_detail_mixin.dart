import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/works/view/work_detail_view.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/services/customer_service.dart';
import 'package:pikseltesisat/product/services/personal_service.dart';
import 'package:pikseltesisat/product/services/work_service.dart';

mixin WorkDetailMixin on State<WorkDetailView> {
  final loadingNotifier = ValueNotifier<bool>(false);
  final _workService = WorkService();
  late final work = widget.work;
  final ValueNotifier<Customer?> customerNotifier = ValueNotifier(null);
  final ValueNotifier<Personal?> personalNotifier = ValueNotifier(null);

  Query<Work>? oldWorksQuery;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    loadingNotifier.value = true;
    customerNotifier.value =
        await CustomerService().getCustomer(work.customerId ?? '');
    if (work.personalId != null) {
      personalNotifier.value =
          await PersonalService().getPersonal(work.personalId ?? '');
    }
    if (customerNotifier.value == null) {
      return;
    }
    final customer = customerNotifier.value!;
    oldWorksQuery = _workService.workCollection
        .where(
          FirestoreFields.customerId.name,
          isEqualTo: customer.id,
        )
        .orderBy(
          FirestoreFields.workDate.name,
          descending: true,
        );
    loadingNotifier.value = false;
  }
}
