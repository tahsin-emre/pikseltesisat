part of '../../view/work_detail_view.dart';

final class _WorkDetailActions extends StatelessWidget {
  const _WorkDetailActions({
    required this.onCompleteWork,
    required this.onPriceOffer,
    required this.onAddComment,
  });
  final VoidCallback onCompleteWork;
  final VoidCallback onPriceOffer;
  final VoidCallback onAddComment;
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.pix_outlined,
      children: [
        SpeedDialChild(
          label: LocaleKeys.work_completeWork.tr(),
          child: AppIcons.done.toIcon,
          onTap: onCompleteWork,
        ),
        SpeedDialChild(
          label: LocaleKeys.work_priceOffer.tr(),
          child: AppIcons.priceOffer.toIcon,
          onTap: onPriceOffer,
        ),
        SpeedDialChild(
          label: LocaleKeys.work_addLog.tr(),
          child: AppIcons.comment.toIcon,
          onTap: onAddComment,
        ),
      ],
    );
  }
}
