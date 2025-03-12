part of '../../view/work_detail_view.dart';

final class _CustomerCard extends StatelessWidget {
  const _CustomerCard(this.customerNotifier);
  final ValueNotifier<Customer?> customerNotifier;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: customerNotifier,
      builder: (_, customer, __) {
        return Card(child: CustomerDetailCard(customer ?? const Customer()));
      },
    );
  }
}
