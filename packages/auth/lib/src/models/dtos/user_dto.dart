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
    @Default(Gender.unknown) Gender gender,
    @Default(Countries.unknown) Countries country,
    @Default('') String description,
    @Default('') String photoUrl,
    @Default([]) List<SpecificInterest> areasOfInterest,
    @Default([]) List<SocialMediaDto> socialMedia,
    @Default(ProfileType.unknown) ProfileType profileType,
    @Default(Seniority.unknown) Seniority seniority,
    @Default(false) bool onboardingCompleted,
    @Default('') String phoneNumber,
    @Default('') String companyOrSchool,
    @Default('') String title,
    @Default([]) List<Objective> objective,
    @Default(-1) int yearsOfProfesionalExperience,
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
        socialMedia: user.socialMedia.map(SocialMediaDto.fromModel).toList(),
        profileType: user.profileType,
        seniority: user.seniority,
        onboardingCompleted: user.onboardingCompleted,
        phoneNumber: user.phoneNumber,
        companyOrSchool: user.companyOrSchool,
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
        socialMedia: socialMedia.map((e) => e.toModel()).toList(),
        profileType: profileType,
        seniority: seniority,
        onboardingCompleted: onboardingCompleted,
        phoneNumber: phoneNumber,
        companyOrSchool: companyOrSchool,
        title: title,
        objective: objective,
        birthDate: birthDate,
        yearsOfProfesionalExperience: yearsOfProfesionalExperience,
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mail': mail,
      'firstName': firstName,
      'lastName': lastName,
      'googleName': googleName,
      'gender': gender.name,
      'country': country,
      'description': description,
      'photoUrl': photoUrl,
      'areasOfInterest': areasOfInterest.map((e) => e.name).toList(),
      'socialMedia': socialMedia.map((e) => e.toJson()).toList(),
      'profileType': profileType,
      'seniority': seniority.name,
      'onboardingCompleted': onboardingCompleted,
      'phoneNumber': phoneNumber,
      'companyOrSchool': companyOrSchool,
      'title': title,
      'objective': objective.map((e) => e.name).toList(),
      'yearsOfProfesionalExperience': yearsOfProfesionalExperience,
      'birthDate': birthDate?.toIso8601String(),
    };
  }
}
