// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  String get id => throw _privateConstructorUsedError;
  String get mail => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get googleName => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  List<SpecificInterest> get areasOfInterest =>
      throw _privateConstructorUsedError;
  List<SocialMedia> get socialMedia => throw _privateConstructorUsedError;
  ProfileType get profileType => throw _privateConstructorUsedError;
  Seniority get seniority => throw _privateConstructorUsedError;
  bool get onboardingCompleted => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  String get school => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  Objective get objective => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {String id,
      String mail,
      String firstName,
      String lastName,
      String googleName,
      String country,
      String description,
      String photoUrl,
      List<SpecificInterest> areasOfInterest,
      List<SocialMedia> socialMedia,
      ProfileType profileType,
      Seniority seniority,
      bool onboardingCompleted,
      String phoneNumber,
      String company,
      String school,
      String title,
      Objective objective,
      DateTime? birthDate});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mail = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? googleName = null,
    Object? country = null,
    Object? description = null,
    Object? photoUrl = null,
    Object? areasOfInterest = null,
    Object? socialMedia = null,
    Object? profileType = null,
    Object? seniority = null,
    Object? onboardingCompleted = null,
    Object? phoneNumber = null,
    Object? company = null,
    Object? school = null,
    Object? title = null,
    Object? objective = null,
    Object? birthDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mail: null == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      googleName: null == googleName
          ? _value.googleName
          : googleName // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      areasOfInterest: null == areasOfInterest
          ? _value.areasOfInterest
          : areasOfInterest // ignore: cast_nullable_to_non_nullable
              as List<SpecificInterest>,
      socialMedia: null == socialMedia
          ? _value.socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as List<SocialMedia>,
      profileType: null == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
              as ProfileType,
      seniority: null == seniority
          ? _value.seniority
          : seniority // ignore: cast_nullable_to_non_nullable
              as Seniority,
      onboardingCompleted: null == onboardingCompleted
          ? _value.onboardingCompleted
          : onboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      school: null == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      objective: null == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as Objective,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$_UserDtoCopyWith(
          _$_UserDto value, $Res Function(_$_UserDto) then) =
      __$$_UserDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String mail,
      String firstName,
      String lastName,
      String googleName,
      String country,
      String description,
      String photoUrl,
      List<SpecificInterest> areasOfInterest,
      List<SocialMedia> socialMedia,
      ProfileType profileType,
      Seniority seniority,
      bool onboardingCompleted,
      String phoneNumber,
      String company,
      String school,
      String title,
      Objective objective,
      DateTime? birthDate});
}

/// @nodoc
class __$$_UserDtoCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$_UserDto>
    implements _$$_UserDtoCopyWith<$Res> {
  __$$_UserDtoCopyWithImpl(_$_UserDto _value, $Res Function(_$_UserDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mail = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? googleName = null,
    Object? country = null,
    Object? description = null,
    Object? photoUrl = null,
    Object? areasOfInterest = null,
    Object? socialMedia = null,
    Object? profileType = null,
    Object? seniority = null,
    Object? onboardingCompleted = null,
    Object? phoneNumber = null,
    Object? company = null,
    Object? school = null,
    Object? title = null,
    Object? objective = null,
    Object? birthDate = freezed,
  }) {
    return _then(_$_UserDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mail: null == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      googleName: null == googleName
          ? _value.googleName
          : googleName // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      areasOfInterest: null == areasOfInterest
          ? _value._areasOfInterest
          : areasOfInterest // ignore: cast_nullable_to_non_nullable
              as List<SpecificInterest>,
      socialMedia: null == socialMedia
          ? _value._socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as List<SocialMedia>,
      profileType: null == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
              as ProfileType,
      seniority: null == seniority
          ? _value.seniority
          : seniority // ignore: cast_nullable_to_non_nullable
              as Seniority,
      onboardingCompleted: null == onboardingCompleted
          ? _value.onboardingCompleted
          : onboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      school: null == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      objective: null == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as Objective,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDto extends _UserDto {
  const _$_UserDto(
      {required this.id,
      required this.mail,
      this.firstName = '',
      this.lastName = '',
      this.googleName = '',
      this.country = '',
      this.description = '',
      this.photoUrl = '',
      final List<SpecificInterest> areasOfInterest = const [],
      final List<SocialMedia> socialMedia = const [],
      this.profileType = ProfileType.unknown,
      this.seniority = Seniority.unknown,
      this.onboardingCompleted = false,
      this.phoneNumber = '',
      this.company = '',
      this.school = '',
      this.title = '',
      this.objective = Objective.other,
      this.birthDate})
      : _areasOfInterest = areasOfInterest,
        _socialMedia = socialMedia,
        super._();

  factory _$_UserDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDtoFromJson(json);

  @override
  final String id;
  @override
  final String mail;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String googleName;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String photoUrl;
  final List<SpecificInterest> _areasOfInterest;
  @override
  @JsonKey()
  List<SpecificInterest> get areasOfInterest {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_areasOfInterest);
  }

  final List<SocialMedia> _socialMedia;
  @override
  @JsonKey()
  List<SocialMedia> get socialMedia {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socialMedia);
  }

  @override
  @JsonKey()
  final ProfileType profileType;
  @override
  @JsonKey()
  final Seniority seniority;
  @override
  @JsonKey()
  final bool onboardingCompleted;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String company;
  @override
  @JsonKey()
  final String school;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final Objective objective;
  @override
  final DateTime? birthDate;

  @override
  String toString() {
    return 'UserDto(id: $id, mail: $mail, firstName: $firstName, lastName: $lastName, googleName: $googleName, country: $country, description: $description, photoUrl: $photoUrl, areasOfInterest: $areasOfInterest, socialMedia: $socialMedia, profileType: $profileType, seniority: $seniority, onboardingCompleted: $onboardingCompleted, phoneNumber: $phoneNumber, company: $company, school: $school, title: $title, objective: $objective, birthDate: $birthDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mail, mail) || other.mail == mail) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.googleName, googleName) ||
                other.googleName == googleName) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            const DeepCollectionEquality()
                .equals(other._areasOfInterest, _areasOfInterest) &&
            const DeepCollectionEquality()
                .equals(other._socialMedia, _socialMedia) &&
            (identical(other.profileType, profileType) ||
                other.profileType == profileType) &&
            (identical(other.seniority, seniority) ||
                other.seniority == seniority) &&
            (identical(other.onboardingCompleted, onboardingCompleted) ||
                other.onboardingCompleted == onboardingCompleted) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.objective, objective) ||
                other.objective == objective) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        mail,
        firstName,
        lastName,
        googleName,
        country,
        description,
        photoUrl,
        const DeepCollectionEquality().hash(_areasOfInterest),
        const DeepCollectionEquality().hash(_socialMedia),
        profileType,
        seniority,
        onboardingCompleted,
        phoneNumber,
        company,
        school,
        title,
        objective,
        birthDate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDtoCopyWith<_$_UserDto> get copyWith =>
      __$$_UserDtoCopyWithImpl<_$_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDtoToJson(
      this,
    );
  }
}

abstract class _UserDto extends UserDto {
  const factory _UserDto(
      {required final String id,
      required final String mail,
      final String firstName,
      final String lastName,
      final String googleName,
      final String country,
      final String description,
      final String photoUrl,
      final List<SpecificInterest> areasOfInterest,
      final List<SocialMedia> socialMedia,
      final ProfileType profileType,
      final Seniority seniority,
      final bool onboardingCompleted,
      final String phoneNumber,
      final String company,
      final String school,
      final String title,
      final Objective objective,
      final DateTime? birthDate}) = _$_UserDto;
  const _UserDto._() : super._();

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$_UserDto.fromJson;

  @override
  String get id;
  @override
  String get mail;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get googleName;
  @override
  String get country;
  @override
  String get description;
  @override
  String get photoUrl;
  @override
  List<SpecificInterest> get areasOfInterest;
  @override
  List<SocialMedia> get socialMedia;
  @override
  ProfileType get profileType;
  @override
  Seniority get seniority;
  @override
  bool get onboardingCompleted;
  @override
  String get phoneNumber;
  @override
  String get company;
  @override
  String get school;
  @override
  String get title;
  @override
  Objective get objective;
  @override
  DateTime? get birthDate;
  @override
  @JsonKey(ignore: true)
  _$$_UserDtoCopyWith<_$_UserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
