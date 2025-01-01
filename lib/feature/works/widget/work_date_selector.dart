import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';

final class WorkDateSelector extends StatefulWidget {
  const WorkDateSelector({
    required this.onSelected,
    required this.initWorkDate,
    super.key,
  });
  final DateTime initWorkDate;
  final ValueChanged<DateTime?> onSelected;
  @override
  State<WorkDateSelector> createState() => _WorkDateSelectorState();
}

class _WorkDateSelectorState extends State<WorkDateSelector> {
  late DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allXXS,
      child: Card(
        child: ListTile(
          onTap: onSelect,
          title: Text(text),
          subtitle: Text(LocaleKeys.work_workDate.tr()),
          trailing: AppIcons.calendar.toIcon,
        ),
      ),
    );
  }

  String get text {
    final result = DateFormat('dd MMMM y EEEE, HH:mm').format(selectedDate);
    return result;
  }

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initWorkDate;
  }

  Future<void> onSelect() async {
    final newDate = await selectDate();
    if (newDate == null) return;
    final newHour = await selectTime();
    if (newHour == null) return;
    final dateTime = DateTime(
      newDate.year,
      newDate.month,
      newDate.day,
      newHour.hour,
      newHour.minute,
    );
    setState(() {
      selectedDate = dateTime;
      widget.onSelected(newDate);
    });
  }

  Future<DateTime?> selectDate() async {
    return showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
  }

  Future<TimeOfDay?> selectTime() async {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
    );
  }
}
