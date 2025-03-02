import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/works/view/work_detail_view.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/services/customer_service.dart';
import 'package:pikseltesisat/product/services/plumber_service.dart';

mixin WorkDetailMixin on State<WorkDetailView> {
  final loadingNotifier = ValueNotifier<bool>(true);
  late final work = widget.work;
  Customer? customer;
  Plumber? plumber;
  final addressNotifier = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    customer = await CustomerService().getCustomer(work.customerId ?? '');
    if (work.plumberId != null) {
      plumber = await PlumberService().getPlumber(work.plumberId ?? '');
    }

    addressNotifier.value = customer?.address ?? '';
    loadingNotifier.value = false;
  }
}
