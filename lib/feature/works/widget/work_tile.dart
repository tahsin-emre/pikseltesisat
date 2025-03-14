import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/services/customer_service.dart';
import 'package:pikseltesisat/product/services/personal_service.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/extensions/app_sizes_ext.dart';
import 'package:skeletonizer/skeletonizer.dart';

final class WorkTile extends StatefulWidget {
  const WorkTile(this.work, {this.clickable = true, super.key});
  final Work work;
  final bool clickable;
  @override
  State<WorkTile> createState() => _WorkTileState();
}

class _WorkTileState extends State<WorkTile> {
  final loadingNotifier = ValueNotifier<bool>(false);
  Customer? customer;
  Personal? personal;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loadingNotifier,
      builder: (_, isLoading, __) {
        return Skeletonizer(
          enabled: isLoading,
          child: Card(
            child: ListTile(
              onTap: widget.clickable
                  ? () => WorkDetailRoute(widget.work).push<void>(context)
                  : null,
              title: Text(
                '${customer?.name} - $personalName',
              ),
              subtitle: _Subtitle(
                work: widget.work,
                customer: customer,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(price),
                  Text(workDate),
                  Text(workHour),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String get personalName {
    return personal?.name ?? LocaleKeys.personal_personalNotChoosen.tr();
  }

  String get workDate {
    if (widget.work.workDate == null) return '';
    return DateFormat('dd MMMM').format(widget.work.workDate!);
  }

  String get workHour {
    if (widget.work.workDate == null) return '';
    return DateFormat('HH:mm').format(widget.work.workDate!);
    // return DateFormat('dd MMMM y EEEE, HH:mm').format(widget.work.workDate!);
  }

  String get price {
    if (widget.work.workCartItems?.isEmpty ?? true) return '0 ₺';
    final items = widget.work.workCartItems!;
    num total = 0;
    for (final item in items) {
      total += (item.price ?? 0) * (item.count ?? 0);
    }
    return '$total ₺';
  }

  @override
  void initState() {
    super.initState();
    getCustomerAndPersonal();
  }

  Future<void> getCustomerAndPersonal() async {
    if (widget.work.customerId == null) return;
    loadingNotifier.value = true;

    final customerResponse = await locator<CustomerService>()
        .getCustomer(widget.work.customerId ?? '');
    customer = customerResponse;

    if (widget.work.personalId != null) {
      final personalResponse = await locator<PersonalService>()
          .getPersonal(widget.work.personalId ?? '');
      personal = personalResponse;
    }

    loadingNotifier.value = false;
  }
}

final class _Subtitle extends StatelessWidget {
  const _Subtitle({
    required this.work,
    required this.customer,
  });
  final Work work;
  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: AppSizes.s,
              height: AppSizes.s,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: work.serviceType?.color ?? Colors.black,
              ),
            ),
            AppSizes.xs.toWidth,
            Text('${work.serviceType?.localeKey.tr()}'),
            AppSizes.s.toWidth,
            Container(
              width: AppSizes.s,
              height: AppSizes.s,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: work.workType?.color ?? Colors.black,
              ),
            ),
            AppSizes.xs.toWidth,
            Text('${work.workType?.localeKey.tr()}'),
          ],
        ),
        Text('${customer?.address} ${customer?.district?.name}'),
        Text(work.description ?? ''),
      ],
    );
  }
}
