import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/models/work/work.dart';

class WorkDetailView extends StatefulWidget {
  const WorkDetailView({required this.work, super.key});
  final Work work;
  @override
  State<WorkDetailView> createState() => _WorkDetailViewState();
}

class _WorkDetailViewState extends State<WorkDetailView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.work.id),
    );
  }
}
