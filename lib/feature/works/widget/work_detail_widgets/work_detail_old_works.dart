part of '../../view/work_detail_view.dart';

final class _WorkDetailOldWorks extends StatelessWidget {
  const _WorkDetailOldWorks(this.work, this.oldWorksQuery);
  final Query<Work> oldWorksQuery;
  final Work work;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.work_oldWorks.tr()),
        const SizedBox(height: AppSizes.xs),
        FirestoreListView<Work>(
          shrinkWrap: true,
          query: oldWorksQuery,
          emptyBuilder: (context) => const Text('Eski İş Yok'),
          errorBuilder: (context, error, stackTrace) =>
              SelectableText('Hata Oluştu $error'),
          itemBuilder: (_, e) {
            if (e.data() == work) return const SizedBox.shrink();
            return WorkTile(e.data());
          },
        ),
      ],
    );
  }
}
