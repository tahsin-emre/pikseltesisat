import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/models/work/work_comment.dart';
import 'package:pikseltesisat/product/services/base_service.dart';

final class WorkService extends BaseService {
  factory WorkService() => _instance;
  WorkService._();
  static final _instance = WorkService._();

  Future<void> addWork(Work work) async {
    await workCollection.add(work);
  }

  Future<void> addComment(String workId, WorkComment comment) async {
    await getCommentCollection(workId).add(comment);
  }

  Future<List<WorkComment>> getComments(String workId) async {
    final snapshot = await getCommentCollection(workId).get();
    return snapshot.docs.map((e) => e.data()).toList();
  }
}
