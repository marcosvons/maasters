import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';
import 'package:maasters/l10n/l10n.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) => Align(
            child: LayoutBuilder(
              builder: (context, boxConstraints) {
                return SizedBox(
                  width: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                      ? context.width * 0.25
                      : context.width * 0.9,
                  height: context.height * 0.065,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: state.isPageCompleted
                          ? MaterialStateProperty.all(
                              context.colorScheme.primary,
                            )
                          : MaterialStateProperty.all(
                              context.colorScheme.disabledButtonBackground,
                            ),
                    ),
                    onPressed: () {
                      if (state.isPageCompleted &&
                          _pageController.page!.toInt() != 5) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                        context.read<OnboardingCubit>().newPageStarted();
                        validateNextPage(
                          currentPage: _pageController.page!.toInt(),
                          context: context,
                        );
                      } else if (state.isPageCompleted) {
                        validateNextPage(
                          currentPage: _pageController.page!.toInt(),
                          context: context,
                        );
                      }
                    },
                    child: Text(
                      context.l10n.next,
                      style: context.textTheme.bodySmall!.copyWith(
                        color: state.isPageCompleted
                            ? context.colorScheme.onPrimary
                            : context.colorScheme.surfaceTint,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void validateNextPage({
    required int currentPage,
    required BuildContext context,
  }) {
    switch (currentPage) {
      case 0:
        context.read<OnboardingCubit>().validateSecondFormPage();
        break;
      case 1:
        context.read<OnboardingCubit>().validateThirdFormPage();
        break;
      case 2:
        context.read<OnboardingCubit>().validateFourthFormPage();
        break;
      case 3:
        if (context.read<OnboardingCubit>().state.user.profileType ==
            ProfileType.mentor) {
          context.read<OnboardingCubit>().validateDescription();
        } else {
          context.read<OnboardingCubit>().validateFifthFormPage();
        }
        break;
      case 4:
        if (context.read<OnboardingCubit>().state.user.profileType ==
            ProfileType.mentor) {
          context.read<UserBloc>().add(
                UserEvent.updateUser(
                  user: context
                      .read<OnboardingCubit>()
                      .state
                      .user
                      .copyWith(onboardingCompleted: true),
                  image: context.read<OnboardingCubit>().state.image,
                ),
              );
        } else {
          context.read<OnboardingCubit>().validateDescription();
        }
        break;
      case 5:
        context.read<UserBloc>().add(
              UserEvent.updateUser(
                user: context
                    .read<OnboardingCubit>()
                    .state
                    .user
                    .copyWith(onboardingCompleted: true),
                image: context.read<OnboardingCubit>().state.image,
              ),
            );
        break;
      default:
        break;
    }
  }
}
