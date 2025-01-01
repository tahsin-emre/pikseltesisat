import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/work/work.dart';

final class WorkTile extends StatelessWidget {
  const WorkTile(this.work, {super.key});
  final Work work;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => WorkDetailRoute(work).push<void>(context),
        title: Text(work.plumberId ?? ''),
        subtitle: Text(work.customerId ?? ''),
      ),
    );
  }
}
