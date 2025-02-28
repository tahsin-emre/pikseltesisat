import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/works/view/work_detail_view.dart';

mixin WorkDetailMixin on State<WorkDetailView> {
  late final work = widget.work;

  @override
  void initState() {
    super.initState();
  }
}
