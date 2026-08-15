import 'auth/auth_models.dart';

class AuthState {
  final bool isAuth;
  final UserContainer? user;
  final String? type;
  final bool isLoading;
  final String? errorMessage;

  const AuthState({
    required this.isAuth,
    this.user,
    this.type,
    this.isLoading = false,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isAuth,
    UserContainer? user,
    String? type,
    bool? isLoading,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return AuthState(
      isAuth: isAuth ?? this.isAuth,
      user: user ?? this.user,
      type: type ?? this.type,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }

  static const unauthenticated = AuthState(isAuth: false);
}
