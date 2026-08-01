import 'auth/auth_models.dart';

class AuthState {
  final bool isAuth;
  final UserContainer? user;
  final String? type;

  const AuthState({required this.isAuth, this.user, this.type});

  AuthState copyWith({bool? isAuth, UserContainer? user, String? type}) {
    return AuthState(
      isAuth: isAuth ?? this.isAuth,
      user: user ?? this.user,
      type: type ?? this.type,
    );
  }

  static const unauthenticated = AuthState(isAuth: false);
}
