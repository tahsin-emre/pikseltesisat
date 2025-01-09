import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/works/view/work_detail_view.dart';
import 'package:pikseltesisat/product/models/work/work.dart';

mixin WorkDetailMixin on State<WorkDetailView> {
  late final Work work;

  @override
  void initState() {
    super.initState();
    setWork();
  }

  void setWork() {
    if (widget.work == null) return;
    work = widget.work!;
  }
}
