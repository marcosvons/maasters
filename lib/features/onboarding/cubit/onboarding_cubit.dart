import 'dart:async';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  FutureOr<void> newPageStarted() async {
    emit(
      state.copyWith(
        isPageCompleted: false,
      ),
    );
  }

  FutureOr<void> validateFirstFormPage({required ProfileType profileType}) {
    emit(
      state.copyWith(
        profileType: profileType,
        isPageCompleted: true,
        linkedinUrl: profileType == ProfileType.mentee ? '' : state.linkedinUrl,
        yearsOfProfesionalExperience: profileType == ProfileType.mentee
            ? 0
            : state.yearsOfProfesionalExperience,
      ),
    );
  }

  FutureOr<void> validateSecondFormPage({
    String? firstName,
    String? lastName,
    Gender? gender,
    String? country,
    DateTime? birthDate,
  }) {
    emit(
      state.copyWith(
        firstName: firstName ?? state.firstName,
        lastName: lastName ?? state.lastName,
        gender: gender ?? state.gender,
        country: country ?? state.country,
        birthDate: birthDate ?? state.birthDate,
      ),
    );
    final isPageCompleted = state.firstName.isNotEmpty &&
        state.lastName.isNotEmpty &&
        state.gender != Gender.unknown &&
        state.birthDate != null;

    emit(state.copyWith(isPageCompleted: isPageCompleted));
  }

  FutureOr<void> validateThirdFormPage({
    SpecificInterest? areasOfInterest,
    String? companyOrSchool,
    String? title,
    int? yearsOfProfessionalExperience,
    String? linkedinUrl,
  }) {
    emit(
      state.copyWith(
        areasOfInterest: areasOfInterest != null &&
                !state.areasOfInterest.contains(areasOfInterest)
            ? [...state.areasOfInterest, areasOfInterest]
            : state.areasOfInterest,
        companyOrSchool: companyOrSchool ?? state.companyOrSchool,
        title: title ?? state.title,
        yearsOfProfesionalExperience:
            yearsOfProfessionalExperience ?? state.yearsOfProfesionalExperience,
        linkedinUrl: linkedinUrl ?? state.linkedinUrl,
      ),
    );
    late final bool isPageCompleted;
    if (state.profileType == ProfileType.mentee) {
      isPageCompleted = state.areasOfInterest.isNotEmpty &&
          state.companyOrSchool.isNotEmpty &&
          state.title.isNotEmpty;
      emit(state.copyWith(isPageCompleted: isPageCompleted));
    }
    if (state.profileType == ProfileType.mentor) {
      isPageCompleted = state.areasOfInterest.isNotEmpty &&
          state.companyOrSchool.isNotEmpty &&
          state.title.isNotEmpty &&
          state.yearsOfProfesionalExperience != 0 &&
          state.linkedinUrl.isNotEmpty;
      emit(state.copyWith(isPageCompleted: isPageCompleted));
    }
  }

  FutureOr<void> removeAreaOfInterest(SpecificInterest areaOfInterest) {
    emit(
      state.copyWith(
        areasOfInterest: state.areasOfInterest
            .where((element) => element != areaOfInterest)
            .toList(),
      ),
    );
  }

  FutureOr<void> validateFourthFormPage({Objective? objective}) {
    final updatedObjectives = <Objective>[...state.objectives];
    if (objective != null) {
      if (updatedObjectives.contains(objective)) {
        updatedObjectives.remove(objective);
      } else {
        updatedObjectives.add(objective);
      }
    }

    emit(
      state.copyWith(
        objectives: updatedObjectives,
        isPageCompleted: updatedObjectives.isNotEmpty,
      ),
    );
  }

  FutureOr<void> removeObjective(Objective objective) {
    emit(
      state.copyWith(
        objectives:
            state.objectives.where((element) => element != objective).toList(),
      ),
    );
  }
}
