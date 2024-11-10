import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/services/base_service.dart';

final class PlumberService extends BaseService {
  factory PlumberService() => _instance;
  PlumberService._();
  static final _instance = PlumberService._();

  late final _collection =
      db.collection(FirestoreCollections.plumbers.name).withConverter(
            toFirestore: (plumber, options) => plumber.toMap(),
            fromFirestore: (snapshot, options) =>
                Plumber.fromMap(snapshot.data()!).copyWith(id: snapshot.id),
          );

  Stream<QuerySnapshot<Plumber>> get plumberListStream =>
      _collection.snapshots();

  Future<String?> addPlumber(Plumber plumber) async {
    try {
      await _collection.add(plumber);
      return null;
    } on Exception {
      return LocaleKeys.base_error.tr();
    }
  }
}
