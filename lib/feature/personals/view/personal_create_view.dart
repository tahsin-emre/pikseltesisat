import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/personals/mixin/personal_create_mixin.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/async_button.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

class PersonalCreateView extends StatefulWidget {
  const PersonalCreateView({this.personal, super.key});
  final Personal? personal;
  @override
  State<PersonalCreateView> createState() => _PersonalCreateViewState();
}

class _PersonalCreateViewState extends State<PersonalCreateView>
    with PersonalCreateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FirestoreListView<MyUser>(
          query: personalService.waitingCollection,
          itemBuilder: (context, user) => _UserRow(
            user.data(),
            onTap: () => confirmPersonal(user.data()),
          ),
        ).expanded,
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
