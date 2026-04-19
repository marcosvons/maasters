import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';
import 'package:maasters/l10n/l10n.dart';

class OnboardingObjective extends StatelessWidget {
  const OnboardingObjective(
    PageController pageController, {
    super.key,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.small),
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LayoutBuilder(
                    builder: (context, boxConstraints) {
                      return Text(
                        context.l10n.objectiveLabel,
                        style:
                            boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                                ? context.textTheme.displayLarge
                                : context.textTheme.displayMedium,
                        textAlign:
                            boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                                ? TextAlign.start
                                : TextAlign.center,
                      );
                    },
                  ),
                  const SizedBox(height: Dimens.xxLarge),
                  BlocBuilder<OnboardingCubit, OnboardingState>(
                    builder: (context, state) {
                      return LayoutBuilder(
                        builder: (context, boxConstraints) {
                          return SizedBox(
                            width: boxConstraints.maxWidth >
                                    Resolutions.mobileMaxWidth
                                ? context.width * 0.35
                                : context.width * 0.9,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: Objective.values.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: Dimens.xSmall,
                                  ),
                                  child: GestureDetector(
                                    child: Container(
                                      height: context.height * 0.065,
                                      decoration: BoxDecoration(
                                        color: context
                                            .colorScheme.tertiaryContainer,
                                        borderRadius:
                                            BorderRadius.circular(Dimens.small),
                                        border: Border.all(
                                          color: state.user.objective.contains(
                                            Objective.values[index],
                                          )
                                              ? context.colorScheme.primary
                                              : context.colorScheme.inputBorder,
                                          width: state.user.objective.contains(
                                            Objective.values[index],
                                          )
                                              ? 2
                                              : 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          Objective.values[index]
                                              .translatedObjective(context),
                                          style: context.textTheme.bodyMedium,
                                        ),
                                      ),
                                    ),
                                    onTap: () => context
                                        .read<OnboardingCubit>()
                                        .validateFifthFormPage(
                                          objective: Objective.values[index],
                                        ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: Dimens.xxLarge * 2),
                  OnboardingNextButton(pageController: _pageController),
                  const SizedBox(height: Dimens.medium),
                  OnboardingBackButton(pageController: _pageController),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
