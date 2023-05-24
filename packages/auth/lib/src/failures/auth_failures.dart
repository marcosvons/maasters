import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failures.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure() = _AuthFailure;
  const factory AuthFailure.internalServerError() = InternalServerError;
  const factory AuthFailure.networkError() = NetworkError;
  const factory AuthFailure.cacheError() = CacheError;
  const factory AuthFailure.unauthorizedError() = UnauthorizedError;
  const factory AuthFailure.emailAlreadyExistsError() = EmailAlreadyExistsError;
  const factory AuthFailure.userNotFoundError() = UserNotFoundError;
  const factory AuthFailure.notFoundError() = NotFoundError;
  const factory AuthFailure.invalidCredentialsError() = InvalidCredentialsError;
  const factory AuthFailure.tokenExpiredError() = TokenExpiredError;
  const factory AuthFailure.unexpectedError() = UnexpectedError;
  const factory AuthFailure.googleSignInError() = GoogleSignInError;
  const factory AuthFailure.unknownError() = UnknownError;
}
