import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pikseltesisat/product/models/firebase_model_helper.dart';
import 'package:pikseltesisat/product/utils/enums/user_type.dart';

part 'my_user.g.dart';

@JsonSerializable()
final class MyUser extends Equatable {
  const MyUser({
    required this.id,
    this.name,
    this.createdAt,
    this.userType = UserType.none,
  });

  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);

  Map<String, dynamic> toJson() => _$MyUserToJson(this);

  MyUser copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    UserType? userType,
  }) {
    return MyUser(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      userType: userType ?? this.userType,
    );
  }

  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: UserType.none)
  final UserType userType;
  final String? name;
  @JsonKey(
    fromJson: FirebaseModelHelper.timestampToDateTime,
    toJson: FirebaseModelHelper.dateTimeToTimestamp,
  )
  final DateTime? createdAt;

  @override
  List<Object?> get props => [
        id,
        name,
        createdAt,
        userType,
      ];
}
