import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

final class AsyncButton extends StatefulWidget {
  const AsyncButton({required this.onTap, required this.label, super.key});
  final Future<void> Function() onTap;
  final String label;
  @override
  State<AsyncButton> createState() => _AsyncButtonState();
}

class _AsyncButtonState extends State<AsyncButton> {
  final ValueNotifier<bool> loadingNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loadingNotifier,
      builder: (_, isLoading, __) {
        return Skeletonizer(
          enabled: isLoading,
          child: ElevatedButton(
            onPressed: () async {
              loadingNotifier.value = true;
              await widget.onTap();
              loadingNotifier.value = false;
            },
            child: Text(widget.label),
          ),
        );
      },
    );
  }
}
