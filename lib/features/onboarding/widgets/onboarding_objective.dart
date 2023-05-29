import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

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
                  Text(
                    '¿Cuales son tus objetivos hoy?',
                    style: context.textTheme.displayLarge,
                  ),
                  const SizedBox(height: Dimens.xxLarge),
                  BlocBuilder<OnboardingCubit, OnboardingState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: context.width * 0.35,
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
                                    color:
                                        context.colorScheme.tertiaryContainer,
                                    borderRadius:
                                        BorderRadius.circular(Dimens.small),
                                    border: Border.all(
                                      color: state.objectives.contains(
                                        Objective.values[index],
                                      )
                                          ? context.colorScheme.primary
                                          : context.colorScheme.inputBorder,
                                      width: state.objectives.contains(
                                        Objective.values[index],
                                      )
                                          ? 2
                                          : 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      Objective.values[index].objective,
                                      style: context.textTheme.bodyMedium,
                                    ),
                                  ),
                                ),
                                onTap: () => context
                                    .read<OnboardingCubit>()
                                    .validateFourthFormPage(
                                      objective: Objective.values[index],
                                    ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: Dimens.xxLarge),
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
