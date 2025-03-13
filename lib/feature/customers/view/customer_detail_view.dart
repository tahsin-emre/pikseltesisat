import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:pikseltesisat/feature/customers/mixin/customer_detail_mixin.dart';
import 'package:pikseltesisat/feature/customers/widget/customer_detail_card.dart';
import 'package:pikseltesisat/feature/sub_features/ui_kit/title_text.dart';
import 'package:pikseltesisat/feature/works/widget/work_new_tile.dart';
import 'package:pikseltesisat/feature/works/widget/work_tile.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/extensions/app_sizes_ext.dart';
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
    return Container(
      padding: AppPaddings.allS,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(LocaleKeys.customer_customerDetail.tr()),
          CustomerDetailCard(customer),
          const Divider(),
          TitleText(LocaleKeys.work_workList.tr()),
          AppSizes.s.toHeight,
          WorkNewTile(customerId: customer.id),
          FirestoreListView<Work>(
            query: query!,
            emptyBuilder: (context) => Padding(
              padding: AppPaddings.allS,
              child: Text(
                LocaleKeys.work_noWorksYet.tr(),
                style: context.general.textTheme.bodyLarge,
              ),
            ),
            errorBuilder: (context, error, stackTrace) =>
                SelectableText('Hata Oluştu $error'),
            itemBuilder: (_, e) => WorkTile(e.data()),
          ).expanded,
        ],
      ),
    );
  }
}
