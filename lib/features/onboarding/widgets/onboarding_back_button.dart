import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';
import 'package:maasters/l10n/l10n.dart';

class OnboardingBackButton extends StatelessWidget {
  const OnboardingBackButton({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return GestureDetector(
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: Dimens.medium,
                    color: context.colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: context.l10n.back,
                  style: context.textTheme.bodySmall!.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            context.read<OnboardingCubit>().validateFirstFormPage(
                  profileType: state.user.profileType,
                );
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
        );
      },
    );
  }
}