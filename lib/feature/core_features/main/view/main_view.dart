import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:pikseltesisat/feature/core_features/main/view/main_drawer.dart';
import 'package:pikseltesisat/feature/core_features/main/widgets/main_app_bar.dart';
import 'package:pikseltesisat/product/utils/extensions/context_ext.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class MainView extends StatefulWidget {
  const MainView(this.child, {super.key});
  final Widget child;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInQuad,
      animationDuration: Durations.medium4,
      openRatio: context.width > 1200 ? .1 : .5,
      drawer: const MainDrawer(),
      child: Scaffold(
        appBar: MainAppBar(onTap: toggleDrawer, context: context),
        body: Row(
          children: [
            if (context.width > 1200)
              const SizedBox(width: 240, child: MainDrawer()),
            Center(child: widget.child).expanded,
          ],
        ),
      ),
    );
  }

  void toggleDrawer() {
    if (context.width > 1200) return;
    _advancedDrawerController.toggleDrawer();
  }
}
