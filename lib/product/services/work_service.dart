import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/services/base_service.dart';

final class WorkService extends BaseService {
  factory WorkService() => _instance;
  WorkService._();
  static final _instance = WorkService._();

  late final _collection =
      db.collection(FirestoreCollections.works.name).withConverter(
            toFirestore: (work, options) => work.toMap(),
            fromFirestore: (snapshot, options) =>
                Work.fromMap(snapshot.data()!).copyWith(id: snapshot.id),
          );

  Stream<QuerySnapshot<Work>> get workListStream => _collection.snapshots();

  Future<String?> addPlumber(Work work) async {
    try {
      await _collection.add(work);
      return null;
    } on Exception {
      return LocaleKeys.base_error.tr();
    }
  }
}
