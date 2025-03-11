part of '../view/work_detail_view.dart';

final class _Address extends StatelessWidget {
  const _Address(this.addressNotifier);
  final ValueNotifier<String> addressNotifier;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: addressNotifier,
      builder: (_, address, __) {
        return Text(
          address,
          style: const TextStyle(
            color: Colors.black,
          ),
        );
      },
    );
  }
}
