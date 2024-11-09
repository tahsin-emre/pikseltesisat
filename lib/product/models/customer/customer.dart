import 'package:equatable/equatable.dart';

final class Customer extends Equatable {
  const Customer({
    required this.id,
    this.name,
  });

  Customer copyWith({
    String? id,
    String? name,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  final String id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}
