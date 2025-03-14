part of '../../view/work_detail_view.dart';

final class _WorkDetailSummary extends StatelessWidget {
  const _WorkDetailSummary({
    required this.work,
    required this.onDetailsPressed,
  });
  final Work work;
  final VoidCallback onDetailsPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allS,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(work.description ?? ''),
          Row(
            children: [
              Text(priceAndDescription),
              AppSizes.xs.toWidth,
              InkWell(
                onTap: onDetailsPressed,
                child: Text(
                  LocaleKeys.base_details.tr(),
                  style: context.teska.textTheme.bodyMedium?.copyWith(
                    color: context.teska.colorScheme.primary,
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String get priceAndDescription {
    if (work.workCartItems?.isEmpty ?? true) return '0 ₺';
    final items = work.workCartItems!;
    num total = 0;
    for (final item in items) {
      total += (item.price ?? 0) * (item.count ?? 0);
    }
    return '${LocaleKeys.base_total.tr()} $total ₺';
  }
}
