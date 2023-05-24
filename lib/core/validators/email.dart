import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email.freezed.dart';

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$",
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return const EmailValidationError.empty();
    if (!_emailRegExp.hasMatch(value)) {
      return const EmailValidationError.invalid();
    }
    return null;
  }
}

@freezed
class EmailValidationError with _$EmailValidationError {
  const factory EmailValidationError.empty() = _Empty;
  const factory EmailValidationError.invalid() = _Invalid;
}
