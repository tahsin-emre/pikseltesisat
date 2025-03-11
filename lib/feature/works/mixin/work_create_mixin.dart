import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/works/view/work_create_view.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/methods/toast.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/services/work_service.dart';
import 'package:pikseltesisat/product/utils/enums/work_type.dart';

mixin WorkCreateMixin on State<WorkCreateView> {
  final _workService = WorkService();
  final formKey = GlobalKey<FormState>();
  late final query = _workService.workCollection;

  final descriptonController = TextEditingController();
  DateTime? workDate;
  WorkType? workType;
  String? plumberId;
  String? customerId;

  @override
  void initState() {
    super.initState();
    setInitialValues();
  }

  Future<void> createWork() async {
    if (!formKey.currentState!.validate()) return;
    final work = Work(
      description: descriptonController.text,
      customerId: customerId,
      plumberId: plumberId,
      workDate: workDate,
      workType: workType,
      createdAt: DateTime.now(),
    );
    try {
      await query.add(work);
      toast(LocaleKeys.work_workAdded.tr());
      pop();
    } on Exception {
      toast(LocaleKeys.base_error.tr());
      return;
    }
  }

  void setInitialValues() {
    descriptonController.text = widget.work?.description ?? '';
    workDate = widget.work?.workDate ?? DateTime.now();
    workType = widget.work?.workType;
    plumberId = widget.work?.plumberId;
    customerId = widget.work?.customerId;
  }

  void selectWorkType(WorkType? newWorkType) {
    if (newWorkType == null) return;
    workType = newWorkType;
  }

  void selectPlumber(Plumber? newPlumber) {
    if (newPlumber == null) return;
    plumberId = newPlumber.id;
  }

  void selectCustomer(Customer? newCustomer) {
    if (newCustomer == null) return;
    customerId = newCustomer.id;
  }

  void selectDate(DateTime? newDate) {
    if (newDate == null) return;
    workDate = newDate;
  }

  void pop() => const WorkListRoute().go(context);
}
