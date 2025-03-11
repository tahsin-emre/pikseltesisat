import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/plumbers/mixin/plumber_list_mixin.dart';
import 'package:pikseltesisat/feature/plumbers/widget/plumber_tile.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/new_element_tile.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class PlumberListView extends StatefulWidget {
  const PlumberListView({super.key});

  @override
  State<PlumberListView> createState() => _PlumberListViewState();
}

class _PlumberListViewState extends State<PlumberListView>
    with PlumberListMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewElementTile(
          icon: AppIcons.addPerson.toIcon,
          title: LocaleKeys.plumber_newPlumber.tr(),
          onTap: () => const PlumberCreateRoute().push<void>(context),
        ),
        FirestoreListView(
          query: plumberQuery,
          itemBuilder: (_, e) => PlumberTile(plumber: e.data()),
        ).expanded,
      ],
    );
  }
}
