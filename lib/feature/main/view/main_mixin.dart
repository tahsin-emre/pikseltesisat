import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/main/view/main_view.dart';

mixin MainMixin on State<MainView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final bodyNotifier = ValueNotifier<Widget>(Container());

  @override
  void initState() {
    super.initState();
  }
}
