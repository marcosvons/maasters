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
                  const _JobAndEducation(),
                  const SizedBox(height: Dimens.large),
                  const _TechnologiesSelector(),
                  if (state.user.profileType == ProfileType.mentor)
                    const _MentorAdditionalInformation(),
                  const SizedBox(height: Dimens.large),
                  const _SeniorityDropdown(),
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

class _SeniorityDropdown extends StatelessWidget {
  const _SeniorityDropdown();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('¿Cuál es tu seniority?'),
        const SizedBox(height: Dimens.medium),
        BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return Container(
              width: context.width * 0.45,
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colorScheme.inputBorder,
                ),
                borderRadius: BorderRadius.circular(Dimens.xSmall),
                color: context.colorScheme.tertiaryContainer,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Seniority>(
                  value: state.user.seniority == Seniority.unknown
                      ? null
                      : state.user.seniority,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Padding(
                    padding: const EdgeInsets.all(Dimens.xSmall),
                    child: Text(
                      'Seleccione uno',
                      style: context.textTheme.bodySmall!.copyWith(
                        color: context.colorScheme.hintText,
                      ),
                    ),
                  ),
                  items: Seniority.values
                      .where((gender) => gender != Seniority.unknown)
                      .map((Seniority gender) {
                    return DropdownMenuItem<Seniority>(
                      value: gender,
                      child: Padding(
                        padding: const EdgeInsets.all(Dimens.xSmall),
                        child: Text(
                          gender.value,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (Seniority? newValue) {
                    context
                        .read<OnboardingCubit>()
                        .validateFourthFormPage(seniority: newValue);
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _JobAndEducation extends StatelessWidget {
  const _JobAndEducation();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OnboardingTextField(
              width: context.width * 0.2125,
              label: 'Empresa/Universidad/Colegio',
              initialValue: state.user.companyOrSchool,
              hintText: 'Ej. Mercado Libre, UBA, Freelancer, etc.',
              onChanged: (value) => context
                  .read<OnboardingCubit>()
                  .validateFourthFormPage(companyOrSchool: value),
            ),
            SizedBox(width: context.width * 0.025),
            OnboardingTextField(
              width: context.width * 0.2125,
              label: 'Titulo',
              initialValue: state.user.companyOrSchool,
              hintText: 'Ej. Product Designer, Estudiante etc.',
              onChanged: (value) => context
                  .read<OnboardingCubit>()
                  .validateFourthFormPage(title: value),
            ),
          ],
        );
      },
    );
  }
}

class _TechnologiesSelector extends StatelessWidget {
  const _TechnologiesSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.user.profileType == ProfileType.mentor
                  ? '¿Qué tecnologías te interesaría mentorear?'
                  : '¿En qué tecnologías estas interesado?',
            ),
            const SizedBox(height: Dimens.medium),
            SizedBox(
              width: context.width * 0.45,
              child: state.user.areasOfInterest.isEmpty
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
                        builder: (_) => BlocProvider.value(
                          value: context.read<OnboardingCubit>(),
                          child: const InterestSelector(),
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            spacing: Dimens.small,
                            runSpacing: Dimens.small,
                            children: state.user.areasOfInterest
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
                                          .validateFourthFormPage();
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
                    ),
            ),
          ],
        );
      },
    );
  }
}

class _MentorAdditionalInformation extends StatelessWidget {
  const _MentorAdditionalInformation();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: Dimens.large),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.width * 0.12875,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Años de experiencia profesional'),
                      const SizedBox(height: Dimens.medium),
                      TextFormField(
                        initialValue:
                            state.user.yearsOfProfesionalExperience == -1
                                ? null
                                : state.user.yearsOfProfesionalExperience
                                    .toString(),
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
                        onChanged: (value) => value.isEmpty
                            ? context
                                .read<OnboardingCubit>()
                                .validateFourthFormPage(
                                  yearsOfProfessionalExperience: -1,
                                )
                            : context
                                .read<OnboardingCubit>()
                                .validateFourthFormPage(
                                  yearsOfProfessionalExperience:
                                      int.tryParse(value),
                                ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: context.width * 0.02125),
                OnboardingTextField(
                  width: context.width * 0.3,
                  label: 'LinkedIn URL',
                  hintText: 'linkedin.com/in/juanperez',
                  initialValue: state.user.socialMedia.isEmpty
                      ? 'linkedin.com/in/'
                      : state.user.socialMedia.first.url,
                  onChanged: (value) => context
                      .read<OnboardingCubit>()
                      .validateFourthFormPage(linkedinUrl: value),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
