import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maasters/core/core.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const _Initial());

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

  FutureOr<void> validateEmail() async {
    return state.email.isNotValid
        ? emit(
            state.copyWith(
              isEmailValid: false,
            ),
          )
        : emit(
            state.copyWith(
              isEmailValid: true,
            ),
          );
  }
}
