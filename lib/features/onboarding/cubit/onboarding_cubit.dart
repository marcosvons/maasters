import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:errors/errors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const OnboardingState.onboardingNotStarted());

  final IAuthRepository _authRepository;

  void saveProgress(User user) {
    emit(OnboardingState.onboardingInProgress(user));
  }

  Future<void> updateUserInFirestore() async {
    final user = state.maybeMap(
      onboardingInProgress: (state) => state.user,
      orElse: () => null,
    );
    if (user != null) {
      emit(const OnboardingState.updatingUser());
      await _authRepository.updateFirestoreUser(user);
    }
  }
}
