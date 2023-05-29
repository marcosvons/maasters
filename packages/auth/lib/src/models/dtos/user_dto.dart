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
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String googleName,
    @Default(Gender.notSpecified) Gender gender,
    @Default('') String country,
    @Default('') String description,
    @Default('') String photoUrl,
    @Default([]) List<SpecificInterest> areasOfInterest,
    @Default([]) List<SocialMedia> socialMedia,
    @Default(ProfileType.unknown) ProfileType profileType,
    @Default(Seniority.unknown) Seniority seniority,
    @Default(false) bool onboardingCompleted,
    @Default('') String phoneNumber,
    @Default('') String company,
    @Default('') String school,
    @Default('') String title,
    @Default([]) List<Objective> objective,
    @Default(0) int yearsOfProfesionalExperience,
    DateTime? birthDate,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  factory UserDto.fromModel(User user) => UserDto(
        id: user.id,
        mail: user.mail,
        firstName: user.firstName,
        lastName: user.lastName,
        googleName: user.googleName,
        gender: user.gender,
        country: user.country,
        description: user.description,
        photoUrl: user.photoUrl,
        areasOfInterest: user.areasOfInterest,
        socialMedia: user.socialMedia,
        profileType: user.profileType,
        seniority: user.seniority,
        onboardingCompleted: user.onboardingCompleted,
        phoneNumber: user.phoneNumber,
        company: user.company,
        school: user.school,
        title: user.title,
        objective: user.objective,
        yearsOfProfesionalExperience: user.yearsOfProfesionalExperience,
        birthDate: user.birthDate,
      );

  factory UserDto.fromFirebaseUser(firebase_auth.User user) => UserDto(
        id: user.uid,
        mail: user.email!,
        googleName: user.displayName != null ? user.displayName! : '',
        photoUrl: user.photoURL != null ? user.photoURL! : '',
      );

  User toModel() => User(
        id: id,
        mail: mail,
        firstName: firstName,
        lastName: lastName,
        googleName: googleName,
        gender: gender,
        country: country,
        description: description,
        photoUrl: photoUrl,
        areasOfInterest: areasOfInterest,
        socialMedia: socialMedia,
        profileType: profileType,
        seniority: seniority,
        onboardingCompleted: onboardingCompleted,
        phoneNumber: phoneNumber,
        company: company,
        school: school,
        title: title,
        objective: objective,
        birthDate: birthDate,
        yearsOfProfesionalExperience: yearsOfProfesionalExperience,
      );
}
