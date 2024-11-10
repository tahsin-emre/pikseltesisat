import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/plumbers/mixin/plumber_list_mixin.dart';
import 'package:pikseltesisat/feature/plumbers/widget/plumber_tile.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/loading.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';

final class PlumberListView extends StatefulWidget {
  const PlumberListView({super.key});

  @override
  State<PlumberListView> createState() => _PlumberListViewState();
}

class _PlumberListViewState extends State<PlumberListView>
    with PlumberListMixin {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: plumberStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Loading();
        final docs = snapshot.data!.docs;
        return ListView(
          children: [
            ...docs.map((e) => PlumberTile(plumber: e.data())),
          ],
        );
      },
    );
  }
}
