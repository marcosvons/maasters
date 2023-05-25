// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticationStateChanges,
    required TResult Function() logoutRequested,
    required TResult Function() listenUserChanges,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authenticationStateChanges,
    TResult? Function()? logoutRequested,
    TResult? Function()? listenUserChanges,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticationStateChanges,
    TResult Function()? logoutRequested,
    TResult Function()? listenUserChanges,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticationStateChanges value)
        authenticationStateChanges,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_ListenToUserChanges value) listenUserChanges,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticationStateChanges value)?
        authenticationStateChanges,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_ListenToUserChanges value)? listenUserChanges,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticationStateChanges value)?
        authenticationStateChanges,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_ListenToUserChanges value)? listenUserChanges,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AuthenticationStateChangesCopyWith<$Res> {
  factory _$$_AuthenticationStateChangesCopyWith(
          _$_AuthenticationStateChanges value,
          $Res Function(_$_AuthenticationStateChanges) then) =
      __$$_AuthenticationStateChangesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthenticationStateChangesCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_AuthenticationStateChanges>
    implements _$$_AuthenticationStateChangesCopyWith<$Res> {
  __$$_AuthenticationStateChangesCopyWithImpl(
      _$_AuthenticationStateChanges _value,
      $Res Function(_$_AuthenticationStateChanges) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthenticationStateChanges implements _AuthenticationStateChanges {
  const _$_AuthenticationStateChanges();

  @override
  String toString() {
    return 'AuthEvent.authenticationStateChanges()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationStateChanges);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticationStateChanges,
    required TResult Function() logoutRequested,
    required TResult Function() listenUserChanges,
  }) {
    return authenticationStateChanges();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authenticationStateChanges,
    TResult? Function()? logoutRequested,
    TResult? Function()? listenUserChanges,
  }) {
    return authenticationStateChanges?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticationStateChanges,
    TResult Function()? logoutRequested,
    TResult Function()? listenUserChanges,
    required TResult orElse(),
  }) {
    if (authenticationStateChanges != null) {
      return authenticationStateChanges();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticationStateChanges value)
        authenticationStateChanges,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_ListenToUserChanges value) listenUserChanges,
  }) {
    return authenticationStateChanges(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticationStateChanges value)?
        authenticationStateChanges,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_ListenToUserChanges value)? listenUserChanges,
  }) {
    return authenticationStateChanges?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticationStateChanges value)?
        authenticationStateChanges,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_ListenToUserChanges value)? listenUserChanges,
    required TResult orElse(),
  }) {
    if (authenticationStateChanges != null) {
      return authenticationStateChanges(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationStateChanges implements AuthEvent {
  const factory _AuthenticationStateChanges() = _$_AuthenticationStateChanges;
}

/// @nodoc
abstract class _$$_LogoutRequestedCopyWith<$Res> {
  factory _$$_LogoutRequestedCopyWith(
          _$_LogoutRequested value, $Res Function(_$_LogoutRequested) then) =
      __$$_LogoutRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LogoutRequestedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_LogoutRequested>
    implements _$$_LogoutRequestedCopyWith<$Res> {
  __$$_LogoutRequestedCopyWithImpl(
      _$_LogoutRequested _value, $Res Function(_$_LogoutRequested) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LogoutRequested implements _LogoutRequested {
  const _$_LogoutRequested();

  @override
  String toString() {
    return 'AuthEvent.logoutRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LogoutRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticationStateChanges,
    required TResult Function() logoutRequested,
    required TResult Function() listenUserChanges,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authenticationStateChanges,
    TResult? Function()? logoutRequested,
    TResult? Function()? listenUserChanges,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticationStateChanges,
    TResult Function()? logoutRequested,
    TResult Function()? listenUserChanges,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticationStateChanges value)
        authenticationStateChanges,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_ListenToUserChanges value) listenUserChanges,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticationStateChanges value)?
        authenticationStateChanges,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_ListenToUserChanges value)? listenUserChanges,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticationStateChanges value)?
        authenticationStateChanges,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_ListenToUserChanges value)? listenUserChanges,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class _LogoutRequested implements AuthEvent {
  const factory _LogoutRequested() = _$_LogoutRequested;
}

/// @nodoc
abstract class _$$_ListenToUserChangesCopyWith<$Res> {
  factory _$$_ListenToUserChangesCopyWith(_$_ListenToUserChanges value,
          $Res Function(_$_ListenToUserChanges) then) =
      __$$_ListenToUserChangesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ListenToUserChangesCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_ListenToUserChanges>
    implements _$$_ListenToUserChangesCopyWith<$Res> {
  __$$_ListenToUserChangesCopyWithImpl(_$_ListenToUserChanges _value,
      $Res Function(_$_ListenToUserChanges) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ListenToUserChanges implements _ListenToUserChanges {
  const _$_ListenToUserChanges();

  @override
  String toString() {
    return 'AuthEvent.listenUserChanges()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ListenToUserChanges);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticationStateChanges,
    required TResult Function() logoutRequested,
    required TResult Function() listenUserChanges,
  }) {
    return listenUserChanges();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authenticationStateChanges,
    TResult? Function()? logoutRequested,
    TResult? Function()? listenUserChanges,
  }) {
    return listenUserChanges?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticationStateChanges,
    TResult Function()? logoutRequested,
    TResult Function()? listenUserChanges,
    required TResult orElse(),
  }) {
    if (listenUserChanges != null) {
      return listenUserChanges();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticationStateChanges value)
        authenticationStateChanges,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_ListenToUserChanges value) listenUserChanges,
  }) {
    return listenUserChanges(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticationStateChanges value)?
        authenticationStateChanges,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_ListenToUserChanges value)? listenUserChanges,
  }) {
    return listenUserChanges?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticationStateChanges value)?
        authenticationStateChanges,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_ListenToUserChanges value)? listenUserChanges,
    required TResult orElse(),
  }) {
    if (listenUserChanges != null) {
      return listenUserChanges(this);
    }
    return orElse();
  }
}

abstract class _ListenToUserChanges implements AuthEvent {
  const factory _ListenToUserChanges() = _$_ListenToUserChanges;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function(Failure? failure) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function(Failure? failure)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function(Failure? failure)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AuthenticatedCopyWith<$Res> {
  factory _$$_AuthenticatedCopyWith(
          _$_Authenticated value, $Res Function(_$_Authenticated) then) =
      __$$_AuthenticatedCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_AuthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Authenticated>
    implements _$$_AuthenticatedCopyWith<$Res> {
  __$$_AuthenticatedCopyWithImpl(
      _$_Authenticated _value, $Res Function(_$_Authenticated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_Authenticated(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_Authenticated implements _Authenticated {
  const _$_Authenticated({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Authenticated &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticatedCopyWith<_$_Authenticated> get copyWith =>
      __$$_AuthenticatedCopyWithImpl<_$_Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function(Failure? failure) unauthenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function(Failure? failure)? unauthenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function(Failure? failure)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthState {
  const factory _Authenticated({required final User user}) = _$_Authenticated;

  User get user;
  @JsonKey(ignore: true)
  _$$_AuthenticatedCopyWith<_$_Authenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnauthenticatedCopyWith<$Res> {
  factory _$$_UnauthenticatedCopyWith(
          _$_Unauthenticated value, $Res Function(_$_Unauthenticated) then) =
      __$$_UnauthenticatedCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure? failure});

  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$_UnauthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Unauthenticated>
    implements _$$_UnauthenticatedCopyWith<$Res> {
  __$$_UnauthenticatedCopyWithImpl(
      _$_Unauthenticated _value, $Res Function(_$_Unauthenticated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$_Unauthenticated(
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Unauthenticated implements _Unauthenticated {
  const _$_Unauthenticated({this.failure});

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'AuthState.unauthenticated(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Unauthenticated &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnauthenticatedCopyWith<_$_Unauthenticated> get copyWith =>
      __$$_UnauthenticatedCopyWithImpl<_$_Unauthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function(Failure? failure) unauthenticated,
  }) {
    return unauthenticated(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function(Failure? failure)? unauthenticated,
  }) {
    return unauthenticated?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function(Failure? failure)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthState {
  const factory _Unauthenticated({final Failure? failure}) = _$_Unauthenticated;

  Failure? get failure;
  @JsonKey(ignore: true)
  _$$_UnauthenticatedCopyWith<_$_Unauthenticated> get copyWith =>
      throw _privateConstructorUsedError;
}
