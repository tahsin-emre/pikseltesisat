import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';

final class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: LocaleKeys.appName.tr()),
      drawer: const Drawer(),
      body: Container(),
    );
  }
}
