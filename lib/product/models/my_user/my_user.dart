import 'package:equatable/equatable.dart';

final class MyUser extends Equatable {
  const MyUser({
    required this.id,
    this.name,
  });

  MyUser copyWith({
    String? id,
    String? name,
  }) {
    return MyUser(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  final String id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}
