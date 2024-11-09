import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/splash/mixin/splash_mixin.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/loading.dart';

final class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SplashMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Loading());
  }
}
