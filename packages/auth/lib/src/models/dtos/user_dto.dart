// ignore_for_file: public_member_api_docs

import 'package:auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    required String mail,
    @Default('') String name,
    @Default([]) List<SpecificInterest> areasOfInterest,
    @Default([]) List<SocialMedia> socialMedia,
    @Default(ProfileType.unknown) ProfileType profileType,
    @Default(Seniority.unknown) Seniority seniority,
    @Default(false) bool onboardingCompleted,
    @Default('') String phoneNumber,
    @Default('') String? company,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  factory UserDto.fromModel(User user) => UserDto(
        id: user.id,
        mail: user.mail,
        name: user.name,
        areasOfInterest: user.areasOfInterest,
        socialMedia: user.socialMedia,
        profileType: user.profileType,
        seniority: user.seniority,
        onboardingCompleted: user.onboardingCompleted,
        phoneNumber: user.phoneNumber,
        company: user.company,
      );

  factory UserDto.fromFirebaseUser(firebase_auth.User user) => UserDto(
        id: user.uid,
        mail: user.email!,
        name: user.displayName != null ? user.displayName! : '',
      );

  User toModel() => User(
        id: id,
        mail: mail,
        name: name,
        areasOfInterest: areasOfInterest,
        socialMedia: socialMedia,
        profileType: profileType,
        seniority: seniority,
        onboardingCompleted: onboardingCompleted,
        phoneNumber: phoneNumber,
        company: company,
      );
}
