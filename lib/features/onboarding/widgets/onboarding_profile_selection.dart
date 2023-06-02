import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';
import 'package:maasters/l10n/l10n.dart';

class OnboardingProfileSelection extends StatelessWidget {
  const OnboardingProfileSelection(PageController pageController, {super.key})
      : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.small,
            vertical: Dimens.xxLarge,
          ),
          child: LayoutBuilder(
            builder: (context, boxConstraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.l10n.onboardingProfileSelectionTitle,
                    style: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                        ? context.textTheme.displayLarge
                        : context.textTheme.displayMedium,
                    textAlign:
                        boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                            ? TextAlign.start
                            : TextAlign.center,
                  ),
                  if (boxConstraints.maxWidth > Resolutions.mobileMaxWidth)
                    const SizedBox(height: Dimens.medium)
                  else
                    const SizedBox.shrink(),
                  if (boxConstraints.maxWidth > Resolutions.mobileMaxWidth)
                    Text(
                      context.l10n.onboardingProfileSelectionSubtitle,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: context.colorScheme.surface,
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  const SizedBox(height: Dimens.xxLarge),
                  LayoutBuilder(
                    builder: (context, boxConstraints) {
                      return boxConstraints.maxWidth >
                              Resolutions.mobileMaxWidth
                          ? _WebProfileDistribution(constraints: boxConstraints)
                          : _MobileProfileDistribution(
                              constraints: boxConstraints,
                            );
                    },
                  ),
                  const SizedBox(height: Dimens.xxLarge),
                  OnboardingNextButton(pageController: _pageController)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _MobileProfileDistribution extends StatelessWidget {
  const _MobileProfileDistribution({
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileSelectionButton(
          image: constraints.maxWidth > Resolutions.mobileMaxWidth
              ? AppIcons.mentee
              : AppIcons.menteeMobile,
          title: context.l10n.beMentee,
          profileDescription: Strings.menteeProfileDescription,
          profileType: ProfileType.mentee,
          onTap: () {
            context.read<OnboardingCubit>().validateFirstFormPage(
                  profileType: ProfileType.mentee,
                );
          },
          constraints: constraints,
        ),
        SizedBox(height: context.width * 0.05),
        ProfileSelectionButton(
          image: constraints.maxWidth > Resolutions.mobileMaxWidth
              ? AppIcons.mentor
              : AppIcons.mentorMobile,
          title: context.l10n.beMentor,
          profileType: ProfileType.mentor,
          profileDescription: Strings.mentorProfileDescription,
          onTap: () {
            context.read<OnboardingCubit>().validateFirstFormPage(
                  profileType: ProfileType.mentor,
                );
          },
          constraints: constraints,
        ),
      ],
    );
  }
}

class _WebProfileDistribution extends StatelessWidget {
  const _WebProfileDistribution({
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileSelectionButton(
          image: constraints.maxWidth > Resolutions.mobileMaxWidth
              ? AppIcons.mentee
              : AppIcons.menteeMobile,
          title: context.l10n.beMentee,
          profileDescription: Strings.menteeProfileDescription,
          profileType: ProfileType.mentee,
          onTap: () {
            context.read<OnboardingCubit>().validateFirstFormPage(
                  profileType: ProfileType.mentee,
                );
          },
          constraints: constraints,
        ),
        SizedBox(width: context.width * 0.05),
        ProfileSelectionButton(
          image: constraints.maxWidth > Resolutions.mobileMaxWidth
              ? AppIcons.mentor
              : AppIcons.mentorMobile,
          title: context.l10n.beMentor,
          profileType: ProfileType.mentor,
          profileDescription: Strings.mentorProfileDescription,
          onTap: () {
            context.read<OnboardingCubit>().validateFirstFormPage(
                  profileType: ProfileType.mentor,
                );
          },
          constraints: constraints,
        ),
      ],
    );
  }
}
