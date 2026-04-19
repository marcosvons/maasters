import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';
import 'package:maasters/l10n/l10n.dart';

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
              LayoutBuilder(
                builder: (context, boxConstraints) {
                  return Text(
                    context.l10n.tellUsAboutYou,
                    style: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
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
              const _GenderDropdown(),
              const SizedBox(height: Dimens.large),
              const _BirthDaySelector(),
              const SizedBox(height: Dimens.large),
              const _PhoneNumber(),
              const SizedBox(height: Dimens.xxLarge * 2),
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
        return LayoutBuilder(
          builder: (context, boxConstraints) {
            return SizedBox(
              width: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                  ? context.width * 0.45
                  : context.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.l10n.phoneNumber),
                  const SizedBox(height: Dimens.large),
                  TextFormField(
                    initialValue: state.user.phoneNumber.isEmpty
                        ? state.user.country.countryCode
                        : state.user.phoneNumber,
                    keyboardType: TextInputType.phone,
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
                      hintText: context.l10n.phoneNumberHint,
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
        Text(context.l10n.birthDateLabel),
        const SizedBox(height: Dimens.medium),
        LayoutBuilder(
          builder: (context, boxConstraints) {
            return SizedBox(
              width: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                  ? context.width * 0.45
                  : context.width * 0.9,
              child: BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return TextFormField(
                    readOnly: true,
                    initialValue: state.user.birthDate
                        ?.formatDateTime(state.user.birthDate!),
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
                          context.l10n.birthDateHint,
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
            );
          },
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
        Text(context.l10n.genderLabel),
        const SizedBox(height: Dimens.medium),
        BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return LayoutBuilder(
              builder: (context, boxConstraints) {
                return Container(
                  width: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                      ? context.width * 0.45
                      : context.width * 0.9,
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
                          context.l10n.genderHint,
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
                              gender.translatedGender(context),
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
            );
          },
        ),
      ],
    );
  }
}
