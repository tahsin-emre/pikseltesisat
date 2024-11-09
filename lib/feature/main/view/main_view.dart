import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:pikseltesisat/feature/main/view/main_drawer.dart';
import 'package:pikseltesisat/feature/main/widgets/main_app_bar.dart';

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
      animationCurve: Curves.easeInOut,
      animationDuration: Durations.medium4,
      openRatio: .5,
      drawer: const MainDrawer(),
      child: Scaffold(
        appBar: MainAppBar(onTap: toggleDrawer),
        body: Center(child: widget.child),
      ),
    );
  }

  void toggleDrawer() {
    _advancedDrawerController.toggleDrawer();
  }
}
