part of '../../view/work_detail_view.dart';

final class _WorkDetailSummary extends StatelessWidget {
  const _WorkDetailSummary({required this.work});
  final Work work;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allS,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(work.description ?? ''),
          Text(priceAndDescription),
        ],
      ),
    );
  }

  String get priceAndDescription {
    if (work.workCartItems?.isEmpty ?? true) return '';
    final price = work.workCartItems!.first.price;
    final description = work.workCartItems!.first.title;
    return '$description - $price';
  }
}
