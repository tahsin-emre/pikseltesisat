import 'package:equatable/equatable.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';

final class AuthState extends Equatable {
  const AuthState({this.myUser});

  AuthState copyWith({
    MyUser? myUser,
  }) {
    return AuthState(
      myUser: myUser ?? this.myUser,
    );
  }

  final MyUser? myUser;

  @override
  List<Object?> get props => [myUser];
}
