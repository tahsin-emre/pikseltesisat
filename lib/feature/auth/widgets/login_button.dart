import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:skeletonizer/skeletonizer.dart';

final class LoginButton extends StatelessWidget {
  const LoginButton({
    required this.loadingNotifier,
    required this.onTap,
    super.key,
  });
  final ValueNotifier<bool> loadingNotifier;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: loadingNotifier,
        builder: (_, isLoading, __) {
          return Skeletonizer(
            enabled: isLoading,
            child: ElevatedButton(
              onPressed: onTap,
              child: Text(LocaleKeys.login_login.tr()),
            ),
          );
        },
      ),
    );
  }
}
