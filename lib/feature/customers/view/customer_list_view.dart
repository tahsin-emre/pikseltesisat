import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/mixin/customer_list_mixin.dart';
import 'package:pikseltesisat/feature/customers/widget/customer_tile.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/loading.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/new_element_tile.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

final class CustomerListView extends StatefulWidget {
  const CustomerListView({super.key});

  @override
  State<CustomerListView> createState() => _CustomerListViewState();
}

class _CustomerListViewState extends State<CustomerListView>
    with CustomerListMixin {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: customerStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Loading();
        final docs = snapshot.data!.docs;
        return ListView(
          children: [
            NewElementTile(
              icon: AppIcons.addPerson.toIcon,
              title: LocaleKeys.customer_newCustomer.tr(),
              onTap: () => const CustomerCreateRoute().push<void>(context),
            ),
            ...docs.map((e) => CustomerTile(customer: e.data())),
          ],
        );
      },
    );
  }
}
