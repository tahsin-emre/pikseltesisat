import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pikseltesisat/product/utils/enums/user_type.dart';
import 'package:pikseltesisat/product/utils/extensions/int_ext.dart';

final class MyUser extends Equatable {
  const MyUser({
    this.id = '',
    this.name,
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
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      userType: (map['userType'] as int?)?.toUserType ?? UserType.none,
    );
  }

  static Map<String, dynamic> toFirestore(MyUser user, SetOptions? _) {
    return {
      'name': user.name,
      'createdAt': user.createdAt,
      'userType': user.userType.index,
    };
  }

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

  final String id;
  final UserType userType;
  final String? name;
  final DateTime? createdAt;

  @override
  List<Object?> get props => [
        id,
        name,
        createdAt,
        userType,
      ];
}
