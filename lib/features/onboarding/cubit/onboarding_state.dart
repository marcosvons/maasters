part of 'onboarding_cubit.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(ProfileType.unknown) ProfileType profileType,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default(Gender.unknown) Gender gender,
    @Default('') String country,
    @Default([]) List<SpecificInterest> areasOfInterest,
    @Default('') String companyOrSchool,
    @Default('') String title,
    @Default(Seniority.unknown) Seniority seniority,
    @Default(0) int yearsOfProfesionalExperience,
    @Default('') String linkedinUrl,
    DateTime? birthDate,
    @Default([]) List<Objective> objectives,
    @Default(false) bool isPageCompleted,
  }) = _Initial;
}
