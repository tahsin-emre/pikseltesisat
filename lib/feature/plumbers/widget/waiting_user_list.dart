import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/async_button.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/services/plumber_service.dart';

final class WaitingUserList extends StatefulWidget {
  const WaitingUserList({super.key});

  @override
  State<WaitingUserList> createState() => _WaitingUserListState();
}

class _WaitingUserListState extends State<WaitingUserList> {
  final _plumberService = PlumberService();

  @override
  Widget build(BuildContext context) {
    return FirestoreListView<MyUser>(
      query: _plumberService.waitingCollection,
      itemBuilder: (context, user) => _UserRow(user.data()),
    );
  }
}

final class _UserRow extends StatelessWidget {
  const _UserRow(this.user);
  final MyUser user;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name ?? ''),
        trailing: AsyncButton(
          onTap: () async {},
          label: LocaleKeys.base_confirm.tr(),
        ),
      ),
    );
  }
}
