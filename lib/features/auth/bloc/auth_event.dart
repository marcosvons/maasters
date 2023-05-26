part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authenticationStateChanges() =
      _AuthenticationStateChanges;
  const factory AuthEvent.logoutRequested() = _LogoutRequested;
  const factory AuthEvent.listenUserChanges() = _ListenToUserChanges;
}
