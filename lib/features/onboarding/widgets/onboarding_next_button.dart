import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

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
            child: SizedBox(
              width: context.width * 0.25,
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
                  if (state.isPageCompleted) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                    context.read<OnboardingCubit>().newPageStarted();
                    validateNextPage(
                      currentPage: _pageController.page!.toInt(),
                      context: context,
                    );
                  }
                },
                child: Text(
                  'Continuar',
                  style: context.textTheme.bodySmall!.copyWith(
                    color: state.isPageCompleted
                        ? context.colorScheme.onPrimary
                        : context.colorScheme.surfaceTint,
                  ),
                ),
              ),
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
        context.read<OnboardingCubit>().validateFifthFormPage();
        break;
      case 4:
        context.read<OnboardingCubit>().validateDescription();
        break;
      case 5:
        context.read<UserBloc>().add(
              UserEvent.updateUser(
                user: context.read<OnboardingCubit>().state.user,
              ),
            );
        break;
      default:
        break;
    }
  }
}
