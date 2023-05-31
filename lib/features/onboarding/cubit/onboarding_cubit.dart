import 'dart:async';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({required User user}) : super(_Initial(user: user));

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
        user: state.user.copyWith(
          profileType: profileType,
          socialMedia:
              profileType == ProfileType.mentee ? [] : state.user.socialMedia,
          yearsOfProfesionalExperience: profileType == ProfileType.mentee
              ? 0
              : state.user.yearsOfProfesionalExperience,
        ),
        isPageCompleted: true,
      ),
    );
  }

  FutureOr<void> validateSecondFormPage({
    String? firstName,
    String? lastName,
    Countries? country,
    Uint8List? image,
  }) {
    emit(
      state.copyWith(
        user: state.user.copyWith(
          firstName: firstName ?? state.user.firstName,
          lastName: lastName ?? state.user.lastName,
          country: country ?? state.user.country,
        ),
        image: image ?? state.image,
      ),
    );

    final isPageCompleted = state.user.firstName.isNotEmpty &&
        state.user.lastName.isNotEmpty &&
        state.user.country != Countries.unknown;

    emit(state.copyWith(isPageCompleted: isPageCompleted));
  }

  FutureOr<void> validateThirdFormPage({
    String? phoneNumber,
    Gender? gender,
    DateTime? birthDate,
  }) {
    emit(
      state.copyWith(
        user: state.user.copyWith(
          phoneNumber: phoneNumber ?? state.user.phoneNumber,
          gender: gender ?? state.user.gender,
          birthDate: birthDate ?? state.user.birthDate,
        ),
      ),
    );

    final isPageCompleted = state.user.birthDate != null &&
        state.user.phoneNumber.isNotEmpty &&
        state.user.gender != Gender.unknown;

    emit(state.copyWith(isPageCompleted: isPageCompleted));
  }

  FutureOr<void> validateFourthFormPage({
    SpecificInterest? areasOfInterest,
    String? companyOrSchool,
    String? title,
    int? yearsOfProfessionalExperience,
    String? linkedinUrl,
    Seniority? seniority,
  }) {
    emit(
      state.copyWith(
        user: state.user.copyWith(
          areasOfInterest: areasOfInterest != null &&
                  !state.user.areasOfInterest.contains(areasOfInterest)
              ? [...state.user.areasOfInterest, areasOfInterest]
              : state.user.areasOfInterest,
          companyOrSchool: companyOrSchool ?? state.user.companyOrSchool,
          title: title ?? state.user.title,
          yearsOfProfesionalExperience: yearsOfProfessionalExperience ??
              state.user.yearsOfProfesionalExperience,
          socialMedia: linkedinUrl != null
              ? [SocialMedia(name: 'LinkedIn', url: linkedinUrl)]
              : state.user.socialMedia,
          seniority: seniority ?? state.user.seniority,
        ),
      ),
    );

    late final bool isPageCompleted;

    if (state.user.profileType == ProfileType.mentee) {
      isPageCompleted = state.user.areasOfInterest.isNotEmpty &&
          state.user.companyOrSchool.isNotEmpty &&
          state.user.title.isNotEmpty &&
          state.user.seniority != Seniority.unknown;
      emit(state.copyWith(isPageCompleted: isPageCompleted));
    }
    if (state.user.profileType == ProfileType.mentor) {
      isPageCompleted = state.user.areasOfInterest.isNotEmpty &&
          state.user.companyOrSchool.isNotEmpty &&
          state.user.title.isNotEmpty &&
          state.user.yearsOfProfesionalExperience != -1 &&
          state.user.socialMedia.isNotEmpty &&
          state.user.seniority != Seniority.unknown;
      emit(state.copyWith(isPageCompleted: isPageCompleted));
    }
  }

  FutureOr<void> removeAreaOfInterest(SpecificInterest areaOfInterest) {
    emit(
      state.copyWith(
        user: state.user.copyWith(
          areasOfInterest: state.user.areasOfInterest
              .where((element) => element != areaOfInterest)
              .toList(),
        ),
      ),
    );
  }

  FutureOr<void> validateFifthFormPage({Objective? objective}) {
    final updatedObjectives = <Objective>[...state.user.objective];
    if (objective != null) {
      if (updatedObjectives.contains(objective)) {
        updatedObjectives.remove(objective);
      } else {
        updatedObjectives.add(objective);
      }
    }

    emit(
      state.copyWith(
        user: state.user.copyWith(
          objective: updatedObjectives,
        ),
        isPageCompleted: updatedObjectives.isNotEmpty,
      ),
    );
  }

  FutureOr<void> removeObjective(Objective objective) {
    emit(
      state.copyWith(
        user: state.user.copyWith(
          objective: state.user.objective
              .where((element) => element != objective)
              .toList(),
        ),
      ),
    );
  }

  FutureOr<void> validateDescription({String? description}) {
    emit(
      state.copyWith(
        user: state.user.copyWith(
          description: description ?? '',
        ),
        isPageCompleted: state.user.description.isNotEmpty,
      ),
    );
  }
}
