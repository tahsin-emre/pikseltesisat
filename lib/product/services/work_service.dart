import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/services/base_service.dart';

final class WorkService extends BaseService {
  factory WorkService() => _instance;
  WorkService._();
  static final _instance = WorkService._();

  late final workCollection =
      db.collection(FirestoreCollections.works.name).withConverter(
            toFirestore: Work.toFirestore,
            fromFirestore: Work.fromFirestore,
          );

  Future<void> addWork(Work work) async {
    await workCollection.add(work);
  }
}
