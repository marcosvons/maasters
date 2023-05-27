import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class OnboardingProfileSelection extends StatelessWidget {
  const OnboardingProfileSelection(PageController pageController, {super.key})
      : _pageController = pageController;

  final PageController _pageController;

  static const int fieldsToBeCompleted = 1;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.small),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¿Qué deseas hacer en MaaSters?',
                style: context.textTheme.displayLarge,
              ),
              const SizedBox(height: Dimens.medium),
              Text(
                'Vas a poder conectarte con el mejor talento emergente de Latinoamerica',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colorScheme.surface,
                ),
              ),
              const SizedBox(height: Dimens.xxLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileSelectionButton(
                    image: AppIcons.mentee,
                    title: 'Ser mentoreado',
                    profileDescription: Strings.menteeProfileDescription,
                    profileType: ProfileType.mentee,
                    onTap: () {
                      context.read<OnboardingCubit>().newPageStarted();
                      context.read<OnboardingCubit>().saveProgress(
                            user: context.read<AuthBloc>().state.user!.copyWith(
                                  profileType: ProfileType.mentee,
                                ),
                            completed: 1,
                          );
                    },
                  ),
                  SizedBox(width: context.width * 0.05),
                  ProfileSelectionButton(
                    image: AppIcons.mentor,
                    title: 'Ser mentor',
                    profileType: ProfileType.mentor,
                    profileDescription: Strings.mentorProfileDescription,
                    onTap: () {
                      context.read<OnboardingCubit>().newPageStarted();
                      context.read<OnboardingCubit>().saveProgress(
                            user: context.read<AuthBloc>().state.user!.copyWith(
                                  profileType: ProfileType.mentor,
                                ),
                            completed: 1,
                          );
                    },
                  ),
                ],
              ),
              const SizedBox(height: Dimens.xxLarge),
              BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) => state.maybeMap(
                  orElse: SizedBox.shrink,
                  onboardingInProgress: (state) => Align(
                    child: SizedBox(
                      width: context.width * 0.25,
                      height: context.height * 0.065,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: state.fieldsCompleted ==
                                  fieldsToBeCompleted
                              ? MaterialStateProperty.all(
                                  context.colorScheme.primary,
                                )
                              : MaterialStateProperty.all(
                                  context.colorScheme.disabledButtonBackground,
                                ),
                        ),
                        onPressed: () {
                          if (state.fieldsCompleted == fieldsToBeCompleted) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                            context.read<OnboardingCubit>().newPageStarted();
                          }
                        },
                        child: Text(
                          'Continuar',
                          style: context.textTheme.bodySmall!.copyWith(
                            color: state.fieldsCompleted == fieldsToBeCompleted
                                ? context.colorScheme.onPrimary
                                : context.colorScheme.surfaceTint,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
