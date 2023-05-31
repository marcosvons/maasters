import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class OnboardingDescription extends StatelessWidget {
  const OnboardingDescription(PageController pageController, {super.key})
      : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeMap(
          loading: (_) => const CircularProgressIndicator(),
          success: (_) => Navigator.of(context).push<void>(HomePage.route()),
          failure: (failure) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: context.colorScheme.error,
              content: Text(
                failure.toString(),
              ),
            ),
          ),
          orElse: () {},
        );
      },
      child: Align(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.small),
            child: BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return SizedBox(
                  width: context.width * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Queremos saber mas de vos',
                        style: context.textTheme.displayLarge,
                      ),
                      const SizedBox(height: Dimens.medium),
                      Text(
                        'Escribe un resumen de tu experiencia laboral, educación y conocimientos. ${state.user.profileType == ProfileType.mentor ? '¿Qué es lo que puedes aportar en tus mentorías?' : '¿Qué es lo que buscas aprender en tus mentorías?'}',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorScheme.surface,
                        ),
                      ),
                      const SizedBox(height: Dimens.xxLarge * 2),
                      const _DescriptionTextField(),
                      const SizedBox(height: Dimens.xxLarge),
                      OnboardingNextButton(pageController: _pageController),
                      const SizedBox(height: Dimens.medium),
                      OnboardingBackButton(pageController: _pageController),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _DescriptionTextField extends StatelessWidget {
  const _DescriptionTextField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: (value) => context
              .read<OnboardingCubit>()
              .validateDescription(description: value),
          decoration: InputDecoration(
            hintText:
                'Ocupo el cargo de Product Designer en Apple que escribe sobre diseño. Estudie en la UP y me encanta el diseño de interfaces.',
            hintStyle: context.textTheme.bodyMedium!.copyWith(
              color: context.colorScheme.hintText,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.small),
              borderSide: BorderSide(
                color: context.colorScheme.inputBorder,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.small),
              borderSide: BorderSide(
                color: context.colorScheme.inputBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.small),
              borderSide: BorderSide(
                color: context.colorScheme.primary,
                width: 2,
              ),
            ),
          ),
          maxLines: 10,
          minLines: 10,
          maxLength: 200,
        ),
      ],
    );
  }
}
