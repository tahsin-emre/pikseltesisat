import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/works/mixin/work_detail_mixin.dart';
import 'package:pikseltesisat/product/models/work/work.dart';

class WorkDetailView extends StatefulWidget {
  const WorkDetailView({required this.work, super.key});
  final Work? work;
  @override
  State<WorkDetailView> createState() => _WorkDetailViewState();
}

class _WorkDetailViewState extends State<WorkDetailView> with WorkDetailMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.work == null) return const SizedBox();
    return Center(
      child: Text(work.id),
    );
  }
}
