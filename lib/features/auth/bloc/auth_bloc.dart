import 'dart:async';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const _Unauthenticated()) {
    on<_AuthenticationStateChanges>(_onAuthenticationStateChanges);
    on<_ListenToUserChanges>(_onListenToUserChanges);
    on<_LogoutRequested>(_onLogoutRequested);

    add(const _AuthenticationStateChanges());
    add(const _ListenToUserChanges());
  }

  final IAuthRepository _authRepository;

  FutureOr<void> _onAuthenticationStateChanges(
    _AuthenticationStateChanges event,
    Emitter<AuthState> emit,
  ) async {
    await emit.forEach(
      _authRepository.firebaseUser,
      onData: (Either<Failure, Option<User>> possibleFailureOrUser) {
        return possibleFailureOrUser.fold(
          (failure) => _Unauthenticated(failure: failure),
          (userOption) => userOption.fold(
            _Unauthenticated.new,
            (user) => _Authenticated(user: user),
          ),
        );
      },
    );
  }

  FutureOr<void> _onListenToUserChanges(
    _ListenToUserChanges event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.map(
        authenticated: (authenticated) => authenticated,
        unauthenticated: (unauthenticated) => unauthenticated,
      ),
    );
    emit.forEach(
      _authRepository.cacheUser,
      onData: (Either<Failure, User?> possibleFailureOrUser) {
        return possibleFailureOrUser.fold(
          (failure) => _Unauthenticated(failure: failure),
          (user) {
            if (user == null) return const _Unauthenticated();
            return _Authenticated(user: user);
          },
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
