// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'social_media_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SocialMediaDto _$SocialMediaDtoFromJson(Map<String, dynamic> json) {
  return _SocialMediaDto.fromJson(json);
}

/// @nodoc
mixin _$SocialMediaDto {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialMediaDtoCopyWith<SocialMediaDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialMediaDtoCopyWith<$Res> {
  factory $SocialMediaDtoCopyWith(
          SocialMediaDto value, $Res Function(SocialMediaDto) then) =
      _$SocialMediaDtoCopyWithImpl<$Res, SocialMediaDto>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$SocialMediaDtoCopyWithImpl<$Res, $Val extends SocialMediaDto>
    implements $SocialMediaDtoCopyWith<$Res> {
  _$SocialMediaDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_SocialMediaDtoCopyWith<$Res>
    implements $SocialMediaDtoCopyWith<$Res> {
  factory _$$_SocialMediaDtoCopyWith(
          _$_SocialMediaDto value, $Res Function(_$_SocialMediaDto) then) =
      __$$_SocialMediaDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$_SocialMediaDtoCopyWithImpl<$Res>
    extends _$SocialMediaDtoCopyWithImpl<$Res, _$_SocialMediaDto>
    implements _$$_SocialMediaDtoCopyWith<$Res> {
  __$$_SocialMediaDtoCopyWithImpl(
      _$_SocialMediaDto _value, $Res Function(_$_SocialMediaDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_SocialMediaDto(
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
@JsonSerializable()
class _$_SocialMediaDto extends _SocialMediaDto {
  const _$_SocialMediaDto({required this.name, required this.url}) : super._();

  factory _$_SocialMediaDto.fromJson(Map<String, dynamic> json) =>
      _$$_SocialMediaDtoFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'SocialMediaDto(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SocialMediaDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SocialMediaDtoCopyWith<_$_SocialMediaDto> get copyWith =>
      __$$_SocialMediaDtoCopyWithImpl<_$_SocialMediaDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SocialMediaDtoToJson(
      this,
    );
  }
}

abstract class _SocialMediaDto extends SocialMediaDto {
  const factory _SocialMediaDto(
      {required final String name,
      required final String url}) = _$_SocialMediaDto;
  const _SocialMediaDto._() : super._();

  factory _SocialMediaDto.fromJson(Map<String, dynamic> json) =
      _$_SocialMediaDto.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_SocialMediaDtoCopyWith<_$_SocialMediaDto> get copyWith =>
      throw _privateConstructorUsedError;
}
