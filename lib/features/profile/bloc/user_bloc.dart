import 'dart:async';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:errors/errors.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const _Initial()) {
    on<_UpdateUser>(_onUpdateUser);
  }

  final IAuthRepository _authRepository;

  FutureOr<void> _onUpdateUser(
    _UpdateUser event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());

    final possibleUpdatedUserOrFailure = await _authRepository
        .updateFirestoreUser(user: event.user, image: event.image);

    possibleUpdatedUserOrFailure.fold((failure) => emit(_Failure(failure)),
        (_) {
      emit(const UserState.success());
    });
  }
}
