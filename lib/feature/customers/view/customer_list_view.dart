import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/mixin/customer_list_mixin.dart';
import 'package:pikseltesisat/feature/customers/widget/customer_tile.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/new_element_tile.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class CustomerListView extends StatefulWidget {
  const CustomerListView({super.key});

  @override
  State<CustomerListView> createState() => _CustomerListViewState();
}

class _CustomerListViewState extends State<CustomerListView>
    with CustomerListMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewElementTile(
          icon: AppIcons.addPerson.toIcon,
          title: LocaleKeys.customer_newCustomer.tr(),
          onTap: () => const CustomerCreateRoute().go(context),
        ),
        FirestoreListView(
          query: customerStream,
          pageSize: 5,
          itemBuilder: (_, e) => CustomerTile(customer: e.data()),
        ).expanded,
      ],
    );
  }
}
