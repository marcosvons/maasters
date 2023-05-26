part of 'onboarding_cubit.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.onboardingNotStarted() = _OnboardingNotStarted;
  const factory OnboardingState.onboardingInProgress(User user) =
      _OnboardingInProgress;
  const factory OnboardingState.updatingUser() = _UpdatingUser;
  const factory OnboardingState.onboardingSuccess() = _OnboardingFinished;
  const factory OnboardingState.onboardingFailure({Failure? failure}) =
      _OnboardingFailure;
}
