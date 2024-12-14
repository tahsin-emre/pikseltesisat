import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pikseltesisat/product/models/my_user/user_type.dart';

final class MyUser extends Equatable {
  const MyUser({
    this.id = '',
    this.name,
    this.surname,
    this.createdAt,
    this.userType = UserType.none,
  });

  factory MyUser.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final map = snapshot.data()!;
    return MyUser(
      id: snapshot.id,
      name: map['name'] as String?,
      surname: map['surname'] as String?,
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      userType: UserType.values[(map['userType'] as int?) ?? 0],
    );
  }

  static Map<String, dynamic> toFirestore(MyUser user, SetOptions? _) {
    return {
      'name': user.name,
      'surname': user.surname,
      'createdAt': user.createdAt,
      'userType': user.userType.index,
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
  final UserType userType;
  final String? name;
  final String? surname;
  final DateTime? createdAt;

  @override
  List<Object?> get props => [
        id,
        name,
        surname,
        createdAt,
        userType,
      ];
}
