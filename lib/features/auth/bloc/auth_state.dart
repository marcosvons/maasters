part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticated({required User user}) = _Authenticated;
  const factory AuthState.unauthenticated({Failure? failure}) =
      _Unauthenticated;

  const AuthState._();

  User? get user => whenOrNull(
        authenticated: (user) => user,
      );
}
