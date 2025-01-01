import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/works/view/work_create_view.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/services/work_service.dart';
import 'package:pikseltesisat/product/utils/enums/work_kind.dart';
import 'package:pikseltesisat/product/utils/extensions/context_ext.dart';

mixin WorkCreateMixin on State<WorkCreateView> {
  final _workService = WorkService();
  final formKey = GlobalKey<FormState>();
  late final query = _workService.workCollection;

  final descriptonController = TextEditingController();
  DateTime? workDate;
  WorkKind? workKind;
  String? plumberId;

  @override
  void initState() {
    super.initState();
    setInitialValues();
  }

  Future<void> createWork() async {
    if (!formKey.currentState!.validate()) return;
    final work = Work(
      description: descriptonController.text,
      customerId: widget.work.customerId,
      plumberId: plumberId,
      workDate: workDate,
      createdAt: DateTime.now(),
    );
    try {
      await query.add(work);
      notifyUser(LocaleKeys.base_save.tr());
    } catch (e) {
      notifyUser(LocaleKeys.base_error.tr());
    }
  }

  void setInitialValues() {
    descriptonController.text = widget.work.description ?? '';
    workDate = widget.work.workDate;
    workKind = widget.work.workKind;
    plumberId = widget.work.plumberId;
  }

  void selectWorkKind(WorkKind? newWorkKind) {
    if (newWorkKind == null) return;
    workKind = newWorkKind;
  }

  void selectPlumberId(String? newPlumberId) {
    if (newPlumberId == null) return;
    plumberId = newPlumberId;
  }

  void notifyUser(String message) => context.notify(message);
}
