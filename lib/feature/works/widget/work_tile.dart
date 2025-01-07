import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';

final class WorkTile extends StatefulWidget {
  const WorkTile(this.work, {super.key});
  final Work work;

  @override
  State<WorkTile> createState() => _WorkTileState();
}

class _WorkTileState extends State<WorkTile> {
  final loadingNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => WorkDetailRoute(widget.work).go(context),
        title: Text(workDate),
        subtitle: subtitle,
      ),
    );
  }

  Widget get subtitle {
    if (widget.work.workKind == null) return const SizedBox();
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.work.workKind!.color,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        Text(widget.work.workKind?.localeKey.tr() ?? ''),
      ],
    );
  }

  String get workDate {
    if (widget.work.workDate == null) return '';
    return DateFormat('dd MMMM y EEEE, HH:mm').format(widget.work.workDate!);
  }
}
