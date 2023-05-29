import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class OnboardingProfileSelection extends StatelessWidget {
  const OnboardingProfileSelection(PageController pageController, {super.key})
      : _pageController = pageController;

  final PageController _pageController;

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
                      context.read<OnboardingCubit>().validateFirstFormPage(
                          profileType: ProfileType.mentee);
                    },
                  ),
                  SizedBox(width: context.width * 0.05),
                  ProfileSelectionButton(
                    image: AppIcons.mentor,
                    title: 'Ser mentor',
                    profileType: ProfileType.mentor,
                    profileDescription: Strings.mentorProfileDescription,
                    onTap: () {
                      context.read<OnboardingCubit>().validateFirstFormPage(
                          profileType: ProfileType.mentor);
                    },
                  ),
                ],
              ),
              const SizedBox(height: Dimens.xxLarge),
              OnboardingNextButton(pageController: _pageController)
            ],
          ),
        ),
      ),
    );
  }
}
