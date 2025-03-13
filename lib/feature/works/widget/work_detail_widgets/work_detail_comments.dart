part of '../../view/work_detail_view.dart';

final class _WorkDetailComments extends StatefulWidget {
  const _WorkDetailComments({required this.workId});
  final String workId;
  @override
  State<_WorkDetailComments> createState() => _WorkDetailCommentsState();
}

class _WorkDetailCommentsState extends State<_WorkDetailComments> {
  final _workService = locator<WorkService>();
  final comments = <WorkComment>[];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.work_workLogs.tr(),
          style: context.general.textTheme.headlineSmall,
        ),
        ...comments.map(_CommentItem.new),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(_fetchComments);
  }

  Future<void> _fetchComments() async {
    final result = await _workService.getComments(widget.workId);
    setState(() {
      comments.addAll(result);
    });
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
      subtitle: Text('${comment.personalName} - $date'),
    );
  }

  String get date {
    if (comment.createdAt == null) return '';
    return DateFormat('dd MMMM HH:mm').format(comment.createdAt!);
  }
}
