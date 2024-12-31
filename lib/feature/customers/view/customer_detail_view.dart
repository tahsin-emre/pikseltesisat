import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/mixin/customer_detail_mixin.dart';
import 'package:pikseltesisat/feature/customers/widget/customer_detail_card.dart';
import 'package:pikseltesisat/feature/customers/widget/customer_detail_fab.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/loading.dart';
import 'package:pikseltesisat/feature/works/widget/work_tile.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
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
      appBar: BaseAppBar(title: LocaleKeys.customer_customerDetail.tr()),
      floatingActionButton: const CustomerDetailFab(),
      body: ValueListenableBuilder(
        valueListenable: loadingNotifier,
        builder: (_, isLoading, __) {
          if (isLoading) return const Loading();
          return Container(
            padding: AppPaddings.allS,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomerDetailCard(widget.customer),
                const Divider(),
                Text(LocaleKeys.work_workList.tr()),
                FirestoreListView<Work>(
                  query: query,
                  itemBuilder: (_, e) => WorkTile(e.data()),
                ).expanded,
              ],
            ),
          );
        },
      ),
    );
  }
}
