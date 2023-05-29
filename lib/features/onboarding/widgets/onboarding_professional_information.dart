import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class OnboardingProfessionalInformation extends StatelessWidget {
  const OnboardingProfessionalInformation(
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
                    '¡Un gusto! ¿Cuál es tu superpoder?',
                    style: context.textTheme.displayLarge,
                  ),
                  const SizedBox(height: Dimens.xxLarge),
                  const _TechnologiesSelector(),
                  const SizedBox(height: Dimens.large),
                  OnboardingTextField(
                    width: context.width * 0.45,
                    label: 'Empresa/Universidad/Colegio',
                    initialValue: state.companyOrSchool,
                    hintText: 'Ej. Mercado Libre, UBA, Freelancer, etc.',
                    onChanged: (value) => context
                        .read<OnboardingCubit>()
                        .validateThirdFormPage(companyOrSchool: value),
                  ),
                  const SizedBox(height: Dimens.large),
                  OnboardingTextField(
                    width: context.width * 0.45,
                    label: 'Titulo',
                    initialValue: state.companyOrSchool,
                    hintText: 'Ej. Product Designer, Estudiante etc.',
                    onChanged: (value) => context
                        .read<OnboardingCubit>()
                        .validateThirdFormPage(title: value),
                  ),
                  if (state.profileType == ProfileType.mentor)
                    const _MentorAdditionalInformation(),
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

class _TechnologiesSelector extends StatelessWidget {
  const _TechnologiesSelector();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('¿En qué tecnologías estas interesado?'),
        const SizedBox(height: Dimens.medium),
        SizedBox(
          width: context.width * 0.45,
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return state.areasOfInterest.isEmpty
                  ? TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            Dimens.xSmall,
                          ),
                          borderSide: BorderSide(
                            color: context.colorScheme.inputBorder,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            Dimens.xSmall,
                          ),
                          borderSide: BorderSide(
                            color: context.colorScheme.inputBorder,
                          ),
                        ),
                        hintText: 'Seleccionar tecnologias',
                        hintStyle: context.textTheme.bodySmall!.copyWith(
                          color: context.colorScheme.hintText,
                        ),
                        filled: true,
                        fillColor: context.colorScheme.tertiaryContainer,
                      ),
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) => const InterestSelector(),
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            spacing: Dimens.small,
                            runSpacing: Dimens.small,
                            children: state.areasOfInterest
                                .map(
                                  (areaOfInterest) => Chip(
                                    label: Text(
                                      areaOfInterest.name,
                                      style:
                                          context.textTheme.bodySmall!.copyWith(
                                        color: context
                                            .colorScheme.onTertiaryContainer,
                                      ),
                                    ),
                                    backgroundColor:
                                        context.colorScheme.tertiaryContainer,
                                    deleteIcon: Icon(
                                      Icons.close,
                                      color: context
                                          .colorScheme.onTertiaryContainer,
                                      size: Dimens.medium,
                                    ),
                                    onDeleted: () {
                                      context
                                          .read<OnboardingCubit>()
                                          .removeAreaOfInterest(
                                            areaOfInterest,
                                          );
                                      context
                                          .read<OnboardingCubit>()
                                          .validateThirdFormPage();
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(width: Dimens.small),
                        GestureDetector(
                          child: Icon(
                            Icons.add_circle_outline,
                            color: context.colorScheme.primary,
                            size: Dimens.medium,
                          ),
                          onTap: () => showDialog(
                            context: context,
                            builder: (_) => const InterestSelector(),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ],
    );
  }
}

class _MentorAdditionalInformation extends StatelessWidget {
  const _MentorAdditionalInformation();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: context.width * 0.175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimens.large),
                  const Text('Años de experiencia profesional'),
                  const SizedBox(height: Dimens.large),
                  TextFormField(
                    initialValue: state.yearsOfProfesionalExperience == 0
                        ? null
                        : state.yearsOfProfesionalExperience.toString(),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          Dimens.xSmall,
                        ),
                        borderSide: BorderSide(
                          color: context.colorScheme.inputBorder,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          Dimens.xSmall,
                        ),
                        borderSide: BorderSide(
                          color: context.colorScheme.primary,
                          width: 2,
                        ),
                      ),
                      hintText: 'Ej. 5',
                      hintStyle: context.textTheme.bodySmall!.copyWith(
                        color: context.colorScheme.hintText,
                      ),
                      filled: true,
                      fillColor: context.colorScheme.tertiaryContainer,
                    ),
                    onChanged: (value) => context
                        .read<OnboardingCubit>()
                        .validateThirdFormPage(
                          yearsOfProfessionalExperience: int.tryParse(value),
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(width: context.width * 0.025),
            SizedBox(
              width: context.width * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimens.large),
                  const Text('LinkedIn URL'),
                  const SizedBox(height: Dimens.large),
                  TextFormField(
                    initialValue: state.linkedinUrl,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          Dimens.xSmall,
                        ),
                        borderSide: BorderSide(
                          color: context.colorScheme.inputBorder,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          Dimens.xSmall,
                        ),
                        borderSide: BorderSide(
                          color: context.colorScheme.primary,
                          width: 2,
                        ),
                      ),
                      hintText: 'linkedin.com/in/juanperez',
                      hintStyle: context.textTheme.bodySmall!.copyWith(
                        color: context.colorScheme.hintText,
                      ),
                      filled: true,
                      fillColor: context.colorScheme.tertiaryContainer,
                    ),
                    onChanged: (value) => context
                        .read<OnboardingCubit>()
                        .validateThirdFormPage(linkedinUrl: value),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
