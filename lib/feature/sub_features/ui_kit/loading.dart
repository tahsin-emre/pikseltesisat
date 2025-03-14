import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pikseltesisat/product/utils/extensions/context_general_ext.dart';

final class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitRipple(
      color: context.teska.colorScheme.primary,
    );
  }
}
