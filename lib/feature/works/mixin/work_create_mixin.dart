import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/feature/works/view/work_create_view.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/methods/toast.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/models/work/work_cart_item.dart';
import 'package:pikseltesisat/product/models/work/work_comment.dart';
import 'package:pikseltesisat/product/services/work_service.dart';
import 'package:pikseltesisat/product/utils/enums/service_type.dart';
import 'package:pikseltesisat/product/utils/enums/work_type.dart';
import 'package:pikseltesisat/product/utils/validators/form_validators.dart';

mixin WorkCreateMixin on State<WorkCreateView> {
  late final _authCubit = context.read<AuthCubit>();
  final _workService = WorkService();
  final formKey = GlobalKey<FormState>();
  late final workCollection = _workService.workCollection;

  final descriptonController = TextEditingController();
  final servicePriceController = TextEditingController();
  DateTime? workDate;
  WorkType? workType;
  ServiceType? serviceType;
  String? personalId;
  String? customerId;

  @override
  void initState() {
    super.initState();
    setInitialValues();
  }

  Future<void> createWork() async {
    if (!formKey.currentState!.validate()) return;

    // Form dışı alanların doğrulaması
    if (!validateNonFormFields()) return;

    final work = Work(
      description: descriptonController.text,
      customerId: customerId,
      personalId: personalId,
      workDate: workDate,
      workType: workType,
      serviceType: serviceType,
      createdAt: DateTime.now(),
      workCartItems: [
        WorkCartItem(
          price: double.parse(servicePriceController.text),
          count: 1,
          title: LocaleKeys.work_servicePrice.tr(),
        ),
      ],
    );
    try {
      final response = await workCollection.add(work);
      toast(LocaleKeys.work_workAdded.tr());
      final commentCollection = _workService.getCommentCollection(response.id);
      await commentCollection.add(
        WorkComment(
          createdAt: DateTime.now(),
          personalName: _authCubit.state.user?.name ?? 'Admin',
          comment: LocaleKeys.work_workCreated.tr(),
        ),
      );
      pop();
    } on Exception {
      toast(LocaleKeys.base_error.tr());
      return;
    }
  }

  /// İş detayı için özel validator
  String? validateDescription(String? value) =>
      FormValidators.required(value) ??
      (value!.length < 5
          ? LocaleKeys.validators_descriptionRequired.tr()
          : null);

  /// Fiyat alanı için özel validator
  String? validatePrice(String? value) {
    final requiredError = FormValidators.required(value);
    if (requiredError != null) return requiredError;

    final numericValue = double.tryParse(value!);
    if (numericValue == null || numericValue <= 0) {
      return LocaleKeys.validators_priceRequired.tr();
    }

    return null;
  }

  /// Form dışındaki alanların doğrulaması
  bool validateNonFormFields() {
    final validationErrors = <String, String>{
      if (workDate == null) 'workDate': LocaleKeys.validators_dateRequired.tr(),
      if (personalId == null)
        'personalId': LocaleKeys.validators_personalRequired.tr(),
      if (workType == null)
        'workType': LocaleKeys.validators_workTypeRequired.tr(),
      if (serviceType == null)
        'serviceType': LocaleKeys.validators_serviceTypeRequired.tr(),
    };

    if (validationErrors.isNotEmpty) {
      toast(validationErrors.values.first);
      return false;
    }

    return true;
  }

  void setInitialValues() {
    descriptonController.text = widget.work?.description ?? '';
    workDate = widget.work?.workDate ?? DateTime.now();
    workType = widget.work?.workType;
    serviceType = widget.work?.serviceType;
    personalId = widget.work?.personalId;
    customerId = widget.work?.customerId;
  }

  void selectWorkType(WorkType? newWorkType) {
    if (newWorkType == null) return;
    setState(() => workType = newWorkType);
  }

  void selectServiceType(ServiceType? newServiceType) {
    if (newServiceType == null) return;
    setState(() => serviceType = newServiceType);
  }

  void selectPersonal(Personal? newPersonal) {
    if (newPersonal == null) return;
    setState(() => personalId = newPersonal.id);
  }

  void selectCustomer(Customer? newCustomer) {
    if (newCustomer == null) return;
    setState(() => customerId = newCustomer.id);
  }

  void selectDate(DateTime? newDate) {
    if (newDate == null) return;
    setState(() => workDate = newDate);
  }

  void pop() => const WorkListRoute().go(context);
}
