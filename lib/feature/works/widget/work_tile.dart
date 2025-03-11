import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/services/customer_service.dart';
import 'package:pikseltesisat/product/services/plumber_service.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
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
  Plumber? plumber;

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
              title: Text(customer?.name ?? ''),
              subtitle: _Subtitle(
                work: widget.work,
                customer: customer,
                plumber: plumber,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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

  String get workDate {
    if (widget.work.workDate == null) return '';
    return DateFormat('dd MMMM').format(widget.work.workDate!);
  }

  String get workHour {
    if (widget.work.workDate == null) return '';
    return DateFormat('HH:mm').format(widget.work.workDate!);
    // return DateFormat('dd MMMM y EEEE, HH:mm').format(widget.work.workDate!);
  }

  @override
  void initState() {
    super.initState();
    getCustomerAndPlumber();
  }

  Future<void> getCustomerAndPlumber() async {
    if (widget.work.customerId == null) return;
    loadingNotifier.value = true;

    final customerResponse =
        await CustomerService().getCustomer(widget.work.customerId ?? '');
    customer = customerResponse;

    if (widget.work.plumberId != null) {
      final plumberResponse =
          await PlumberService().getPlumber(widget.work.plumberId ?? '');
      plumber = plumberResponse;
    }

    loadingNotifier.value = false;
  }
}

final class _Subtitle extends StatelessWidget {
  const _Subtitle({
    required this.work,
    required this.customer,
    required this.plumber,
  });
  final Work work;
  final Customer? customer;
  final Plumber? plumber;

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
                color: work.workType?.color,
              ),
            ),
            const SizedBox(width: AppSizes.xs),
            Text('${work.workType?.localeKey.tr()}'),
          ],
        ),
        Text('${customer?.address} ${customer?.district?.name}'),
        Text(plumber?.name ?? LocaleKeys.plumber_plumberNotChoosen.tr()),
      ],
    );
  }
}
