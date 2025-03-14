import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kartal/kartal.dart';

final class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitRipple(
      color: context.general.colorScheme.primary,
    );
  }
}
