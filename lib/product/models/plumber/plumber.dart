import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

final class Plumber extends Equatable {
  const Plumber({
    this.id = '',
    this.name,
  });

  factory Plumber.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final map = snapshot.data()!;
    return Plumber(
      id: snapshot.id,
      name: map['name'] as String?,
    );
  }

  static Map<String, dynamic> toFirestore(Plumber plumber, SetOptions? _) {
    return {
      'name': plumber.name,
    };
  }

  Plumber copyWith({
    String? id,
    String? name,
  }) {
    return Plumber(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  final String id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}
