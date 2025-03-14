import 'package:cloud_firestore/cloud_firestore.dart';

final class FirebaseModelHelper {
  const FirebaseModelHelper._();

  /// It will convert to datetime from timestamp
  static DateTime timestampToDateTime(Timestamp timestamp) =>
      timestamp.toDate();

  static Timestamp dateTimeToTimestamp(DateTime dateTime) =>
      Timestamp.fromDate(dateTime);
}
