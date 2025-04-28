part of '../../view/work_detail_view.dart';

final class _WorkDetailComments extends StatelessWidget {
  const _WorkDetailComments({required this.commentsQuery});
  final Query<WorkComment> commentsQuery;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.work_workLogs.tr(),
          style: context.teska.textTheme.headlineSmall,
        ),
        AppSizes.xs.toHeight,
        FirestoreListView<WorkComment>(
          shrinkWrap: true,
          query: commentsQuery,
          emptyBuilder: (context) => const Text('İş Kaydı Yok'),
          errorBuilder: (context, error, stackTrace) =>
              SelectableText('Hata Oluştu $error'),
          itemBuilder: (_, e) => _CommentItem(e.data()),
        ),
      ],
    );
  }
}

final class _CommentItem extends StatelessWidget {
  const _CommentItem(this.comment);
  final WorkComment comment;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(comment.comment ?? ''),
      subtitle: Text('${comment.personalName} - ${date(context)}'),
    );
  }

  String date(BuildContext context) {
    if (comment.createdAt == null) return '';
    return DateFormat('dd MMMM HH:mm', context.locale.languageCode)
        .format(comment.createdAt!);
  }
}
