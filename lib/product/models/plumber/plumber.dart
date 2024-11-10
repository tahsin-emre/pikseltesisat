import 'package:equatable/equatable.dart';

final class Plumber extends Equatable {
  const Plumber({
    this.id = '',
    this.name,
  });

  factory Plumber.fromMap(Map<String, dynamic> map) {
    return Plumber(
      name: map['name'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
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
