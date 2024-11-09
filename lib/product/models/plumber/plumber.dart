import 'package:equatable/equatable.dart';

final class Plumber extends Equatable {
  const Plumber({
    required this.id,
    this.name,
  });

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
