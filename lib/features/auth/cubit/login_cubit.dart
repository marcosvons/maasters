import 'dart:async';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maasters/core/core.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const _Initial());

  final IAuthRepository _authRepository;

  FutureOr<void> restartLogin() async {
    return emit(
      state.copyWith(
        status: FormzSubmissionStatus.initial,
        failure: null,
      ),
    );
  }

  FutureOr<void> emailChanged(String value) async {
    final email = Email.dirty(value);
    return emit(
      state.copyWith(
        email: email,
      ),
    );
  }

  FutureOr<void> passwordChanged(String value) async {
    final password = Password.dirty(value);
    return emit(
      state.copyWith(
        password: password,
      ),
    );
  }

  FutureOr<void> passwordVisibilityChanged() async {
    return emit(
      state.copyWith(
        showPassword: !state.showPassword,
      ),
    );
  }

  FutureOr<void> loginWithEmailAndPassword() async {
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    final successOrFailure = await _authRepository.loginWithEmailAndPassword(
      email: state.email.value,
      password: state.password.value,
    );

    return successOrFailure.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          failure: failure,
        ),
      ),
      (success) => emit(state.copyWith(status: FormzSubmissionStatus.success)),
    );
  }

  FutureOr<void> loginWithGoogle({required bool isWeb}) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    if (isWeb) {
      final successOrFailure = await _authRepository.loginWithGoogle();
      return successOrFailure.fold(
        (failure) => emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            failure: failure,
          ),
        ),
        (success) =>
            emit(state.copyWith(status: FormzSubmissionStatus.success)),
      );
    } else {
      final successOrFailure = await _authRepository.loginWithGoogleMobile();
      return successOrFailure.fold(
        (failure) => emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            failure: failure,
          ),
        ),
        (success) =>
            emit(state.copyWith(status: FormzSubmissionStatus.success)),
      );
    }
  }
}
