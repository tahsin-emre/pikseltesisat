import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/feature/works/view/work_list_view.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/services/work_service.dart';
import 'package:pikseltesisat/product/utils/extensions/my_user_ext.dart';

mixin WorkListMixin on State<WorkListView> {
  final _workService = locator<WorkService>();
  final _authCubit = locator<AuthCubit>();
  final dateNotifier = ValueNotifier<DateTime?>(null);

  Query<Work>? workQuery;

  void changeDate(DateTime? date) {
    if (date == null) return;
    dateNotifier.value = date;
    setQuery();
  }

  void setQuery() {
    if (dateNotifier.value == null) return;
    final startDate = dateNotifier.value;
    final endDate = startDate!.add(const Duration(days: 1));
    workQuery = _workService.workCollection
        .where(FirestoreFields.workDate.name, isGreaterThanOrEqualTo: startDate)
        .where(FirestoreFields.workDate.name, isLessThan: endDate);
    if (_authCubit.state.user?.isPersonal ?? false) {
      workQuery = workQuery?.where(
        FirestoreFields.personalId.name,
        isEqualTo: _authCubit.state.user?.id,
      );
    }
    setState(() {});
  }

  void setToday() {
    final now = DateTime.now();
    dateNotifier.value = DateTime(now.year, now.month, now.day);
  }

  @override
  void initState() {
    super.initState();
    setToday();
    Future.microtask(setQuery);
  }
}
