import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/plumbers/mixin/plumber_create_mixin.dart';
import 'package:pikseltesisat/feature/plumbers/widget/waiting_user_list.dart';
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
    return const WaitingUserList();
  }
}
