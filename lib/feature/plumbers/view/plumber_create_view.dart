import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/plumbers/mixin/plumber_create_mixin.dart';
import 'package:pikseltesisat/feature/plumbers/widget/waiting_user_list.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';

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
    return Scaffold(
      appBar: BaseAppBar(title: LocaleKeys.plumber_newPlumber.tr()),
      body: const WaitingUserList(),
    );
  }
}
