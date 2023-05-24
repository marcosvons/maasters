import 'dart:async';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const _Unauthenticated()) {
    on<_AuthenticationStateChanges>(_onAuthenticationStateChanges);
    on<_LogoutRequested>(_onLogoutRequested);

    add(const _AuthenticationStateChanges());
  }

  final IAuthRepository _authRepository;

  FutureOr<void> _onAuthenticationStateChanges(
    _AuthenticationStateChanges event,
    Emitter<AuthState> emit,
  ) async {
    await emit.forEach(
      _authRepository.firebaseUser,
      onData: (Option<firebase_auth.User> possibleFailureOrUser) {
        return possibleFailureOrUser.fold(
          () => const _Unauthenticated(),
          (user) => const _Authenticated(user),
        );
      },
    );
  }

  FutureOr<void> _onLogoutRequested(
    _LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepository.logout();
  }
}
