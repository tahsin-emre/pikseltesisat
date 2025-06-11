import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/price/view/price_offer_create_view.dart';
import 'package:pikseltesisat/feature/works/alerts/work_comment_alert.dart';
import 'package:pikseltesisat/feature/works/alerts/work_price_details_alert.dart';
import 'package:pikseltesisat/feature/works/view/work_detail_view.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/methods/toast.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/models/work/work_cart_item.dart';
import 'package:pikseltesisat/product/models/work/work_comment.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/services/customer_service.dart';
import 'package:pikseltesisat/product/services/personal_service.dart';
import 'package:pikseltesisat/product/services/work_service.dart';

mixin WorkDetailMixin on State<WorkDetailView> {
  late final Work work = widget.work;
  final loadingNotifier = ValueNotifier<bool>(false);
  final WorkService _workService = locator<WorkService>();
  final ValueNotifier<Customer?> customerNotifier = ValueNotifier(null);
  final ValueNotifier<Personal?> personalNotifier = ValueNotifier(null);

  Query<Work>? oldWorksQuery;
  Query<WorkComment>? commentsQuery;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> showDetails() async {
    await showDialog<void>(
      context: context,
      builder: (context) => WorkPriceDetailsAlert(
        workCartItems: work.workCartItems ?? [],
      ),
    );
  }

  Future<void> addComment() async {
    final comment = await showDialog<WorkComment?>(
      context: context,
      builder: (context) => const WorkLogAlert(),
    );
    if (comment == null) return;
    await _workService.addComment(work.id, comment);
  }

  Future<void> completeWork() async {}

  Future<void> priceOffer() async {
    final workCart = await showDialog<List<WorkCartItem>?>(
      context: context,
      builder: (context) => PriceOfferCreateView(
        workCart: work.workCartItems ?? [],
      ),
    );
    if (workCart == null) return;
    await _workService.updateWork(
      work.id,
      work.copyWith(
        workCartItems: workCart,
      ),
    );
    pop();
  }

  void pop() {
    const WorkListRoute().go(context);
    toast(LocaleKeys.workPriceOffer_priceOffered.tr());
  }

  Future<void> _init() async {
    loadingNotifier.value = true;
    customerNotifier.value =
        await locator<CustomerService>().getCustomer(work.customerId ?? '');
    if (work.personalId != null) {
      personalNotifier.value =
          await locator<PersonalService>().getPersonal(work.personalId ?? '');
    }
    if (customerNotifier.value == null) {
      return;
    }
    final customer = customerNotifier.value!;
    oldWorksQuery = _workService.workCollection
        .where(
          FirestoreFields.customerId.name,
          isEqualTo: customer.id,
        )
        .orderBy(
          FirestoreFields.workDate.name,
          descending: true,
        );
    commentsQuery = _workService.getCommentCollection(work.id).orderBy(
          FirestoreFields.createdAt.name,
          descending: true,
        );
    loadingNotifier.value = false;
  }
}
