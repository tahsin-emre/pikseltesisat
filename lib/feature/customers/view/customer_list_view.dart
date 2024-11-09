import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/mixin/customer_list_mixin.dart';
import 'package:pikseltesisat/feature/customers/widget/customer_new_tile.dart';
import 'package:pikseltesisat/feature/customers/widget/customer_tile.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/loading.dart';

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
            const CustomerNewTile(),
            ...docs.map((e) => CustomerTile(customer: e.data())),
          ],
        );
      },
    );
  }
}
