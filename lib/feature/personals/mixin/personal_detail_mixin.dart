import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/personals/view/personal_detail_view.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/services/work_service.dart';

mixin PersonalDetailMixin on State<PersonalDetailView> {
  late final Personal personal = widget.personal;
  final _workService = locator<WorkService>();
  late final query = _workService.workCollection
      .where(
        FirestoreFields.personalId.name,
        isEqualTo: personal.id,
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
