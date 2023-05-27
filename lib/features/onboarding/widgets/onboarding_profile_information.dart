import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class OnboardingProfileInformation extends StatelessWidget {
  const OnboardingProfileInformation(PageController pageController, {super.key})
      : _pageController = pageController;

  final PageController _pageController;

  static const int fieldsToBeCompleted = 2;

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
                'Contanos sobre vos',
                style: context.textTheme.displayLarge,
              ),
              const SizedBox(height: Dimens.xxLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.width * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Nombre'),
                        const SizedBox(height: Dimens.medium),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimens.xSmall),
                              borderSide: BorderSide(
                                color: context.colorScheme.inputBorder,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimens.xSmall),
                              borderSide: BorderSide(
                                color: context.colorScheme.primary,
                                width: 2,
                              ),
                            ),
                            hintText: 'Walter',
                            hintStyle: context.textTheme.bodySmall!.copyWith(
                              color: context.colorScheme.hintText,
                            ),
                            filled: true,
                            fillColor: context.colorScheme.tertiaryContainer,
                          ),
                          onSubmitted: (value) =>
                              context.read<OnboardingCubit>().saveProgress(
                                    user: context
                                        .read<AuthBloc>()
                                        .state
                                        .user!
                                        .copyWith(
                                          firstName: value,
                                        ),
                                    completed: 1,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: context.width * 0.05),
                  SizedBox(
                    width: context.width * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Apellido'),
                        const SizedBox(height: Dimens.medium),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimens.xSmall),
                              borderSide: BorderSide(
                                color: context.colorScheme.inputBorder,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimens.xSmall),
                              borderSide: BorderSide(
                                color: context.colorScheme.primary,
                                width: 2,
                              ),
                            ),
                            hintText: 'White',
                            hintStyle: context.textTheme.bodySmall!.copyWith(
                              color: context.colorScheme.hintText,
                            ),
                            filled: true,
                            fillColor: context.colorScheme.tertiaryContainer,
                          ),
                          onSubmitted: (value) =>
                              context.read<OnboardingCubit>().saveProgress(
                                    user: context
                                        .read<AuthBloc>()
                                        .state
                                        .user!
                                        .copyWith(
                                          lastName: value,
                                        ),
                                    completed: 1,
                                  ),
                        ),
                      ],
                    ),
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
