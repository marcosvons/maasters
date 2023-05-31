import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class OnboardingSecondProfileInformation extends StatelessWidget {
  const OnboardingSecondProfileInformation(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contanos sobre vos',
                style: context.textTheme.displayLarge,
              ),
              const SizedBox(height: Dimens.xxLarge),
              const _GenderDropdown(),
              const SizedBox(height: Dimens.large),
              const _BirthDaySelector(),
              const SizedBox(height: Dimens.large),
              const _PhoneNumber(),
              const SizedBox(height: Dimens.xxLarge),
              OnboardingNextButton(pageController: _pageController),
              const SizedBox(height: Dimens.medium),
              OnboardingBackButton(pageController: _pageController),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneNumber extends StatelessWidget {
  const _PhoneNumber();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return SizedBox(
          width: context.width * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Número de telefono'),
              const SizedBox(height: Dimens.large),
              TextFormField(
                initialValue: state.user.phoneNumber.isEmpty
                    ? state.user.country.countryCode
                    : state.user.phoneNumber,
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
                  hintText: '+54 9 11 5002-9001',
                  hintStyle: context.textTheme.bodySmall!.copyWith(
                    color: context.colorScheme.hintText,
                  ),
                  filled: true,
                  fillColor: context.colorScheme.tertiaryContainer,
                ),
                onChanged: (value) => context
                    .read<OnboardingCubit>()
                    .validateThirdFormPage(phoneNumber: value),
              )
            ],
          ),
        );
      },
    );
  }
}

class _BirthDaySelector extends StatelessWidget {
  const _BirthDaySelector();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('¿Cuándo naciste?'),
        const SizedBox(height: Dimens.medium),
        SizedBox(
          width: context.width * 0.45,
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return TextFormField(
                readOnly: true,
                initialValue:
                    state.user.birthDate?.formatDateTime(state.user.birthDate!),
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.edit_calendar),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimens.xSmall),
                    borderSide: BorderSide(
                      color: context.colorScheme.inputBorder,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimens.xSmall),
                    borderSide: BorderSide(
                      color: context.colorScheme.inputBorder,
                    ),
                  ),
                  hintText: state.user.birthDate
                          ?.formatDateTime(state.user.birthDate!) ??
                      'DD/MM/YYYY',
                  hintStyle: context.textTheme.bodySmall!.copyWith(
                    color: context.colorScheme.hintText,
                  ),
                  filled: true,
                  fillColor: context.colorScheme.tertiaryContainer,
                ),
                onTap: () => showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then(
                  (value) => context
                      .read<OnboardingCubit>()
                      .validateThirdFormPage(birthDate: value),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _GenderDropdown extends StatelessWidget {
  const _GenderDropdown();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('¿Con que género te identificas?'),
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
                child: DropdownButton<Gender>(
                  value: state.user.gender == Gender.unknown
                      ? null
                      : state.user.gender,
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
                  items: Gender.values
                      .where((gender) => gender != Gender.unknown)
                      .map((Gender gender) {
                    return DropdownMenuItem<Gender>(
                      value: gender,
                      child: Padding(
                        padding: const EdgeInsets.all(Dimens.xSmall),
                        child: Text(
                          gender.value,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (Gender? newValue) {
                    context
                        .read<OnboardingCubit>()
                        .validateThirdFormPage(gender: newValue);
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
