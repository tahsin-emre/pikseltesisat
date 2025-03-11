import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

final class Personal extends Equatable {
  const Personal({
    this.id = '',
    this.name,
  });

  factory Personal.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final map = snapshot.data()!;
    return Personal(
      id: snapshot.id,
      name: map['name'] as String?,
    );
  }

  static Map<String, dynamic> toFirestore(Personal personal, SetOptions? _) {
    return {
      'name': personal.name,
    };
  }

  Personal copyWith({
    String? id,
    String? name,
  }) {
    return Personal(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  final String id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}
