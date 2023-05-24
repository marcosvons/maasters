import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password.freezed.dart';

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return const PasswordValidationError.empty();
    if (!_passwordRegExp.hasMatch(value)) {
      return const PasswordValidationError.invalid();
    }
    return null;
  }
}

@freezed
class PasswordValidationError with _$PasswordValidationError {
  const factory PasswordValidationError.empty() = _Empty;
  const factory PasswordValidationError.invalid() = _Invalid;
}
