import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/personals/mixin/personal_list_mixin.dart';
import 'package:pikseltesisat/feature/personals/widget/personal_tile.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/new_element_tile.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class PersonalListView extends StatefulWidget {
  const PersonalListView({super.key});

  @override
  State<PersonalListView> createState() => _PersonalListViewState();
}

class _PersonalListViewState extends State<PersonalListView>
    with PersonalListMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewElementTile(
          icon: AppIcons.addPerson.toIcon,
          title: LocaleKeys.personal_newPersonal.tr(),
          onTap: () => const PersonalCreateRoute().push<void>(context),
        ),
        FirestoreListView(
          query: personalQuery,
          itemBuilder: (_, e) => PersonalTile(personal: e.data()),
        ).expanded,
      ],
    );
  }
}
