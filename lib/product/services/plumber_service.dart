import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/services/base_service.dart';

final class PlumberService extends BaseService {
  factory PlumberService() => _instance;
  PlumberService._();
  static final _instance = PlumberService._();

  late final plumberCollection =
      db.collection(FirestoreCollections.plumbers.name).withConverter(
            toFirestore: Plumber.toFirestore,
            fromFirestore: Plumber.fromFirestore,
          );

  Future<void> addPlumber(Plumber plumber) async {
    await plumberCollection.add(plumber);
  }
}
