import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/auth/cubit/auth_state.dart';
import 'package:pikseltesisat/product/services/auth_service.dart';

final class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  final _authService = AuthService();

  Future<void> findCurrentUser() async {
    final user = await _authService.getUser();
    emit(state.copyWith(user: user));
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    final auth = await _authService.login(email: email, password: password);
    if (auth != null) {
      return auth;
    }
    final user = await _authService.getUser();
    emit(state.copyWith(user: user));
    return null;
  }

  Future<void> logout() async {
    await _authService.logout();
    emit(const AuthState());
  }
}
