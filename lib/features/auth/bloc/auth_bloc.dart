import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const _Unauthenticated()) {
    on<_AuthenticationStateChanges>(_onAuthenticationStateChanges);
    on<_LogoutRequested>(_onLogoutRequested);
  }

  FutureOr<void> _onAuthenticationStateChanges(
    _AuthenticationStateChanges event,
    Emitter<AuthState> emit,
  ) {}

  FutureOr<void> _onLogoutRequested(
    _LogoutRequested event,
    Emitter<AuthState> emit,
  ) {}
}
