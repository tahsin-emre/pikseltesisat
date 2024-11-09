import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'my_user.g.dart';

@JsonSerializable()
final class MyUser extends Equatable {
  const MyUser({
    required this.id,
    this.name,
  });

  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);

  Map<String, dynamic>? toJson() => _$MyUserToJson(this);

  MyUser copyWith({
    String? id,
    String? name,
  }) {
    return MyUser(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @JsonKey(defaultValue: '')
  final String id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}
