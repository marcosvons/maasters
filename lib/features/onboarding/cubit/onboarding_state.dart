part of 'onboarding_cubit.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    required User user,
    @Default(false) bool isPageCompleted,
    Uint8List? image,
  }) = _Initial;
}
