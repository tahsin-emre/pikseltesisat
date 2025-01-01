import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/loading.dart';

final class AsyncButton extends StatefulWidget {
  const AsyncButton({required this.onTap, required this.label, super.key});
  final Future<void> Function() onTap;
  final String label;
  @override
  State<AsyncButton> createState() => _AsyncButtonState();
}

class _AsyncButtonState extends State<AsyncButton> {
  final loadingNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loadingNotifier,
      builder: (_, isLoading, __) {
        if (isLoading) return const Loading();
        return ElevatedButton(
          onPressed: () async {
            loadingNotifier.value = true;
            await widget.onTap();
            loadingNotifier.value = false;
          },
          child: Text(widget.label),
        );
      },
    );
  }
}
