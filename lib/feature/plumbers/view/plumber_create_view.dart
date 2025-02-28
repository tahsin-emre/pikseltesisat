import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/plumbers/mixin/plumber_create_mixin.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/async_button.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

class PlumberCreateView extends StatefulWidget {
  const PlumberCreateView({this.plumber, super.key});
  final Plumber? plumber;
  @override
  State<PlumberCreateView> createState() => _PlumberCreateViewState();
}

class _PlumberCreateViewState extends State<PlumberCreateView>
    with PlumberCreateMixin {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        FirestoreListView<MyUser>(
          query: plumberService.waitingCollection,
          itemBuilder: (context, user) => _UserRow(
            user.data(),
            onTap: () => confirmPlumber(user.data()),
          ),
        ).toSliver,
      ],
    );
  }
}

class _UserRow extends StatelessWidget {
  const _UserRow(this.user, {required this.onTap});
  final MyUser user;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name ?? ''),
        trailing: AsyncButton(
          onTap: () async => onTap(),
          label: LocaleKeys.base_confirm.tr(),
        ),
      ),
    );
  }
}
