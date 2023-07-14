// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mentorships_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MentorshipsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SpecificInterest> interests) addMentor,
    required TResult Function(List<SpecificInterest> interest, String userId)
        getMentors,
    required TResult Function(String query) searchMentors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SpecificInterest> interests)? addMentor,
    TResult? Function(List<SpecificInterest> interest, String userId)?
        getMentors,
    TResult? Function(String query)? searchMentors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SpecificInterest> interests)? addMentor,
    TResult Function(List<SpecificInterest> interest, String userId)?
        getMentors,
    TResult Function(String query)? searchMentors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddMentor value) addMentor,
    required TResult Function(_GetMentors value) getMentors,
    required TResult Function(_SearchMentors value) searchMentors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddMentor value)? addMentor,
    TResult? Function(_GetMentors value)? getMentors,
    TResult? Function(_SearchMentors value)? searchMentors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddMentor value)? addMentor,
    TResult Function(_GetMentors value)? getMentors,
    TResult Function(_SearchMentors value)? searchMentors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MentorshipsEventCopyWith<$Res> {
  factory $MentorshipsEventCopyWith(
          MentorshipsEvent value, $Res Function(MentorshipsEvent) then) =
      _$MentorshipsEventCopyWithImpl<$Res, MentorshipsEvent>;
}

/// @nodoc
class _$MentorshipsEventCopyWithImpl<$Res, $Val extends MentorshipsEvent>
    implements $MentorshipsEventCopyWith<$Res> {
  _$MentorshipsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AddMentorCopyWith<$Res> {
  factory _$$_AddMentorCopyWith(
          _$_AddMentor value, $Res Function(_$_AddMentor) then) =
      __$$_AddMentorCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SpecificInterest> interests});
}

/// @nodoc
class __$$_AddMentorCopyWithImpl<$Res>
    extends _$MentorshipsEventCopyWithImpl<$Res, _$_AddMentor>
    implements _$$_AddMentorCopyWith<$Res> {
  __$$_AddMentorCopyWithImpl(
      _$_AddMentor _value, $Res Function(_$_AddMentor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interests = null,
  }) {
    return _then(_$_AddMentor(
      interests: null == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<SpecificInterest>,
    ));
  }
}

/// @nodoc

class _$_AddMentor implements _AddMentor {
  const _$_AddMentor({required final List<SpecificInterest> interests})
      : _interests = interests;

  final List<SpecificInterest> _interests;
  @override
  List<SpecificInterest> get interests {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  @override
  String toString() {
    return 'MentorshipsEvent.addMentor(interests: $interests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddMentor &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_interests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddMentorCopyWith<_$_AddMentor> get copyWith =>
      __$$_AddMentorCopyWithImpl<_$_AddMentor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SpecificInterest> interests) addMentor,
    required TResult Function(List<SpecificInterest> interest, String userId)
        getMentors,
    required TResult Function(String query) searchMentors,
  }) {
    return addMentor(interests);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SpecificInterest> interests)? addMentor,
    TResult? Function(List<SpecificInterest> interest, String userId)?
        getMentors,
    TResult? Function(String query)? searchMentors,
  }) {
    return addMentor?.call(interests);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SpecificInterest> interests)? addMentor,
    TResult Function(List<SpecificInterest> interest, String userId)?
        getMentors,
    TResult Function(String query)? searchMentors,
    required TResult orElse(),
  }) {
    if (addMentor != null) {
      return addMentor(interests);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddMentor value) addMentor,
    required TResult Function(_GetMentors value) getMentors,
    required TResult Function(_SearchMentors value) searchMentors,
  }) {
    return addMentor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddMentor value)? addMentor,
    TResult? Function(_GetMentors value)? getMentors,
    TResult? Function(_SearchMentors value)? searchMentors,
  }) {
    return addMentor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddMentor value)? addMentor,
    TResult Function(_GetMentors value)? getMentors,
    TResult Function(_SearchMentors value)? searchMentors,
    required TResult orElse(),
  }) {
    if (addMentor != null) {
      return addMentor(this);
    }
    return orElse();
  }
}

abstract class _AddMentor implements MentorshipsEvent {
  const factory _AddMentor({required final List<SpecificInterest> interests}) =
      _$_AddMentor;

  List<SpecificInterest> get interests;
  @JsonKey(ignore: true)
  _$$_AddMentorCopyWith<_$_AddMentor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMentorsCopyWith<$Res> {
  factory _$$_GetMentorsCopyWith(
          _$_GetMentors value, $Res Function(_$_GetMentors) then) =
      __$$_GetMentorsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SpecificInterest> interest, String userId});
}

/// @nodoc
class __$$_GetMentorsCopyWithImpl<$Res>
    extends _$MentorshipsEventCopyWithImpl<$Res, _$_GetMentors>
    implements _$$_GetMentorsCopyWith<$Res> {
  __$$_GetMentorsCopyWithImpl(
      _$_GetMentors _value, $Res Function(_$_GetMentors) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interest = null,
    Object? userId = null,
  }) {
    return _then(_$_GetMentors(
      interest: null == interest
          ? _value._interest
          : interest // ignore: cast_nullable_to_non_nullable
              as List<SpecificInterest>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetMentors implements _GetMentors {
  const _$_GetMentors(
      {required final List<SpecificInterest> interest, required this.userId})
      : _interest = interest;

  final List<SpecificInterest> _interest;
  @override
  List<SpecificInterest> get interest {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interest);
  }

  @override
  final String userId;

  @override
  String toString() {
    return 'MentorshipsEvent.getMentors(interest: $interest, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMentors &&
            const DeepCollectionEquality().equals(other._interest, _interest) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_interest), userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetMentorsCopyWith<_$_GetMentors> get copyWith =>
      __$$_GetMentorsCopyWithImpl<_$_GetMentors>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SpecificInterest> interests) addMentor,
    required TResult Function(List<SpecificInterest> interest, String userId)
        getMentors,
    required TResult Function(String query) searchMentors,
  }) {
    return getMentors(interest, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SpecificInterest> interests)? addMentor,
    TResult? Function(List<SpecificInterest> interest, String userId)?
        getMentors,
    TResult? Function(String query)? searchMentors,
  }) {
    return getMentors?.call(interest, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SpecificInterest> interests)? addMentor,
    TResult Function(List<SpecificInterest> interest, String userId)?
        getMentors,
    TResult Function(String query)? searchMentors,
    required TResult orElse(),
  }) {
    if (getMentors != null) {
      return getMentors(interest, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddMentor value) addMentor,
    required TResult Function(_GetMentors value) getMentors,
    required TResult Function(_SearchMentors value) searchMentors,
  }) {
    return getMentors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddMentor value)? addMentor,
    TResult? Function(_GetMentors value)? getMentors,
    TResult? Function(_SearchMentors value)? searchMentors,
  }) {
    return getMentors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddMentor value)? addMentor,
    TResult Function(_GetMentors value)? getMentors,
    TResult Function(_SearchMentors value)? searchMentors,
    required TResult orElse(),
  }) {
    if (getMentors != null) {
      return getMentors(this);
    }
    return orElse();
  }
}

abstract class _GetMentors implements MentorshipsEvent {
  const factory _GetMentors(
      {required final List<SpecificInterest> interest,
      required final String userId}) = _$_GetMentors;

  List<SpecificInterest> get interest;
  String get userId;
  @JsonKey(ignore: true)
  _$$_GetMentorsCopyWith<_$_GetMentors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SearchMentorsCopyWith<$Res> {
  factory _$$_SearchMentorsCopyWith(
          _$_SearchMentors value, $Res Function(_$_SearchMentors) then) =
      __$$_SearchMentorsCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$_SearchMentorsCopyWithImpl<$Res>
    extends _$MentorshipsEventCopyWithImpl<$Res, _$_SearchMentors>
    implements _$$_SearchMentorsCopyWith<$Res> {
  __$$_SearchMentorsCopyWithImpl(
      _$_SearchMentors _value, $Res Function(_$_SearchMentors) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$_SearchMentors(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchMentors implements _SearchMentors {
  const _$_SearchMentors({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'MentorshipsEvent.searchMentors(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchMentors &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchMentorsCopyWith<_$_SearchMentors> get copyWith =>
      __$$_SearchMentorsCopyWithImpl<_$_SearchMentors>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SpecificInterest> interests) addMentor,
    required TResult Function(List<SpecificInterest> interest, String userId)
        getMentors,
    required TResult Function(String query) searchMentors,
  }) {
    return searchMentors(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SpecificInterest> interests)? addMentor,
    TResult? Function(List<SpecificInterest> interest, String userId)?
        getMentors,
    TResult? Function(String query)? searchMentors,
  }) {
    return searchMentors?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SpecificInterest> interests)? addMentor,
    TResult Function(List<SpecificInterest> interest, String userId)?
        getMentors,
    TResult Function(String query)? searchMentors,
    required TResult orElse(),
  }) {
    if (searchMentors != null) {
      return searchMentors(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddMentor value) addMentor,
    required TResult Function(_GetMentors value) getMentors,
    required TResult Function(_SearchMentors value) searchMentors,
  }) {
    return searchMentors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddMentor value)? addMentor,
    TResult? Function(_GetMentors value)? getMentors,
    TResult? Function(_SearchMentors value)? searchMentors,
  }) {
    return searchMentors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddMentor value)? addMentor,
    TResult Function(_GetMentors value)? getMentors,
    TResult Function(_SearchMentors value)? searchMentors,
    required TResult orElse(),
  }) {
    if (searchMentors != null) {
      return searchMentors(this);
    }
    return orElse();
  }
}

abstract class _SearchMentors implements MentorshipsEvent {
  const factory _SearchMentors({required final String query}) =
      _$_SearchMentors;

  String get query;
  @JsonKey(ignore: true)
  _$$_SearchMentorsCopyWith<_$_SearchMentors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MentorshipsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<User> mentors, List<User> searchedMentors)
        loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<User> mentors, List<User> searchedMentors)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<User> mentors, List<User> searchedMentors)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MentorshipsStateCopyWith<$Res> {
  factory $MentorshipsStateCopyWith(
          MentorshipsState value, $Res Function(MentorshipsState) then) =
      _$MentorshipsStateCopyWithImpl<$Res, MentorshipsState>;
}

/// @nodoc
class _$MentorshipsStateCopyWithImpl<$Res, $Val extends MentorshipsState>
    implements $MentorshipsStateCopyWith<$Res> {
  _$MentorshipsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$MentorshipsStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'MentorshipsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<User> mentors, List<User> searchedMentors)
        loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<User> mentors, List<User> searchedMentors)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<User> mentors, List<User> searchedMentors)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MentorshipsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$MentorshipsStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'MentorshipsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<User> mentors, List<User> searchedMentors)
        loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<User> mentors, List<User> searchedMentors)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<User> mentors, List<User> searchedMentors)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MentorshipsState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<User> mentors, List<User> searchedMentors});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$MentorshipsStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mentors = null,
    Object? searchedMentors = null,
  }) {
    return _then(_$_Loaded(
      mentors: null == mentors
          ? _value._mentors
          : mentors // ignore: cast_nullable_to_non_nullable
              as List<User>,
      searchedMentors: null == searchedMentors
          ? _value._searchedMentors
          : searchedMentors // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(
      {required final List<User> mentors,
      required final List<User> searchedMentors})
      : _mentors = mentors,
        _searchedMentors = searchedMentors;

  final List<User> _mentors;
  @override
  List<User> get mentors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mentors);
  }

  final List<User> _searchedMentors;
  @override
  List<User> get searchedMentors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedMentors);
  }

  @override
  String toString() {
    return 'MentorshipsState.loaded(mentors: $mentors, searchedMentors: $searchedMentors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other._mentors, _mentors) &&
            const DeepCollectionEquality()
                .equals(other._searchedMentors, _searchedMentors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_mentors),
      const DeepCollectionEquality().hash(_searchedMentors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<User> mentors, List<User> searchedMentors)
        loaded,
    required TResult Function() error,
  }) {
    return loaded(mentors, searchedMentors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<User> mentors, List<User> searchedMentors)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(mentors, searchedMentors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<User> mentors, List<User> searchedMentors)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(mentors, searchedMentors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements MentorshipsState {
  const factory _Loaded(
      {required final List<User> mentors,
      required final List<User> searchedMentors}) = _$_Loaded;

  List<User> get mentors;
  List<User> get searchedMentors;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$MentorshipsStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error();

  @override
  String toString() {
    return 'MentorshipsState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<User> mentors, List<User> searchedMentors)
        loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<User> mentors, List<User> searchedMentors)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<User> mentors, List<User> searchedMentors)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MentorshipsState {
  const factory _Error() = _$_Error;
}
