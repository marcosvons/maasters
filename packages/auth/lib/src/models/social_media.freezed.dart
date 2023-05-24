// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'social_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SocialMedia {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SocialMediaCopyWith<SocialMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialMediaCopyWith<$Res> {
  factory $SocialMediaCopyWith(
          SocialMedia value, $Res Function(SocialMedia) then) =
      _$SocialMediaCopyWithImpl<$Res, SocialMedia>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$SocialMediaCopyWithImpl<$Res, $Val extends SocialMedia>
    implements $SocialMediaCopyWith<$Res> {
  _$SocialMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SocialMediaCopyWith<$Res>
    implements $SocialMediaCopyWith<$Res> {
  factory _$$_SocialMediaCopyWith(
          _$_SocialMedia value, $Res Function(_$_SocialMedia) then) =
      __$$_SocialMediaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$_SocialMediaCopyWithImpl<$Res>
    extends _$SocialMediaCopyWithImpl<$Res, _$_SocialMedia>
    implements _$$_SocialMediaCopyWith<$Res> {
  __$$_SocialMediaCopyWithImpl(
      _$_SocialMedia _value, $Res Function(_$_SocialMedia) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_SocialMedia(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SocialMedia implements _SocialMedia {
  const _$_SocialMedia({required this.name, required this.url});

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'SocialMedia(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SocialMedia &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SocialMediaCopyWith<_$_SocialMedia> get copyWith =>
      __$$_SocialMediaCopyWithImpl<_$_SocialMedia>(this, _$identity);
}

abstract class _SocialMedia implements SocialMedia {
  const factory _SocialMedia(
      {required final String name, required final String url}) = _$_SocialMedia;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_SocialMediaCopyWith<_$_SocialMedia> get copyWith =>
      throw _privateConstructorUsedError;
}
