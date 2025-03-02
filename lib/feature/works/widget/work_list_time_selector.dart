import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final class WorkListTimeSelector extends StatefulWidget {
  const WorkListTimeSelector({
    required this.onDateChange,
    required this.focusedDate,
    super.key,
  });
  final ValueChanged<DateTime?> onDateChange;
  final DateTime focusedDate;
  @override
  State<WorkListTimeSelector> createState() => _WorkListTimeSelectorState();
}

class _WorkListTimeSelectorState extends State<WorkListTimeSelector> {
  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLinePicker(
      locale: context.locale,
      onDateChange: widget.onDateChange,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      focusedDate: widget.focusedDate,
      dayElementsOrder: const [
        DayElement.bottom('EEEE'),
        DayElement.middle(),
        DayElement.top('MMMM'),
      ],
    );
  }
}
