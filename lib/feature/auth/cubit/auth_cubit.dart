import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/auth/cubit/auth_state.dart';
import 'package:pikseltesisat/product/services/auth_service.dart';

final class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  final _authService = AuthService();

  Future<void> login({required String email, required String password}) async {
    final user = await _authService.login(email: email, password: password);
    emit(state.copyWith(user: user));
  }

  void logout() => emit(const AuthState());
}
