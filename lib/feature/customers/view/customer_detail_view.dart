import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/mixin/customer_detail_mixin.dart';
import 'package:pikseltesisat/feature/customers/widget/customer_detail_card.dart';
import 'package:pikseltesisat/feature/customers/widget/customer_detail_fab.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class CustomerDetailView extends StatefulWidget {
  const CustomerDetailView({required this.customer, super.key});
  final Customer customer;
  @override
  State<CustomerDetailView> createState() => _CustomerDetailViewState();
}

class _CustomerDetailViewState extends State<CustomerDetailView>
    with CustomerDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomerDetailFab(),
      body: CustomScrollView(
        slivers: [
          BaseAppBar(title: LocaleKeys.customer_customerDetail.tr()).toSliver,
          CustomerDetailCard(widget.customer).toSliver,
          const Divider().toSliver,
          Text('data').toSliver,
        ],
      ),
    );
  }
}
