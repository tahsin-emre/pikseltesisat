import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pikseltesisat/product/models/my_user/user_type.dart';

final class MyUser extends Equatable {
  const MyUser({
    this.id = '',
    this.name,
    this.surname,
    this.createdAt,
    this.userType,
  });

  factory MyUser.fromMap(Map<String, dynamic> map) {
    return MyUser(
      name: map['name'] as String?,
      surname: map['surname'] as String?,
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      userType: UserType.values[map['userType'] as int? ?? 0],
    );
  }

  Map<String, dynamic> get toMap {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'createdAt': createdAt,
      'userType': userType?.index,
    };
  }

  MyUser copyWith({
    String? id,
    String? name,
    String? surname,
    DateTime? createdAt,
    UserType? userType,
  }) {
    return MyUser(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      createdAt: createdAt ?? this.createdAt,
      userType: userType ?? this.userType,
    );
  }

  final String id;
  final String? name;
  final String? surname;
  final DateTime? createdAt;
  final UserType? userType;

  @override
  List<Object?> get props => [
        id,
        name,
        surname,
        createdAt,
        userType,
      ];
}
