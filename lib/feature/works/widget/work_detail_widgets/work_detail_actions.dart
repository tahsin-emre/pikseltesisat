part of '../../view/work_detail_view.dart';

final class _WorkDetailActions extends StatelessWidget {
  const _WorkDetailActions({
    required this.onCompleteWork,
    required this.onPriceOffer,
  });
  final VoidCallback onCompleteWork;
  final VoidCallback onPriceOffer;
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.pix_outlined,
      children: [
        SpeedDialChild(
          label: LocaleKeys.work_addLog.tr(),
          child: AppIcons.add.toIcon,
          onTap: onCompleteWork,
        ),
        SpeedDialChild(
          label: LocaleKeys.work_priceOffer.tr(),
          child: AppIcons.priceOffer.toIcon,
          onTap: onPriceOffer,
        ),
      ],
    );
  }
}
