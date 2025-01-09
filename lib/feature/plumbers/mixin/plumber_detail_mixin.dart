import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/plumbers/view/plumber_detail_view.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/services/work_service.dart';

mixin PlumberDetailMixin on State<PlumberDetailView> {
  late final Plumber plumber;
  final _workService = WorkService();
  late final query = _workService.workCollection
      .where(
        FirestoreFields.plumberId.name,
        isEqualTo: plumber.id,
      )
      .orderBy(
        FirestoreFields.workDate.name,
        descending: true,
      );

  @override
  void initState() {
    super.initState();
    setPlumber();
  }

  void setPlumber() {
    if (widget.plumber == null) return;
    plumber = widget.plumber!;
  }
}
