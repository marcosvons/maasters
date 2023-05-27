// ignore_for_file: public_member_api_docs

import 'package:auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String mail,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String googleName,
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
    @Default(Objective.other) Objective objective,
    DateTime? birthDate,
  }) = _User;
}
