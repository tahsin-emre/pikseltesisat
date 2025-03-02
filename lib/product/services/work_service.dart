import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/services/base_service.dart';

final class WorkService extends BaseService {
  factory WorkService() => _instance;
  WorkService._();
  static final _instance = WorkService._();

  Future<void> addWork(Work work) async {
    await workCollection.add(work);
  }
}
