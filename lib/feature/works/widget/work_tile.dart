import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/models/work/work.dart';

final class WorkTile extends StatelessWidget {
  const WorkTile(this.work, {super.key});
  final Work work;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(work.plumberId ?? ''),
      subtitle: Text(work.customerId ?? ''),
    );
  }
}
