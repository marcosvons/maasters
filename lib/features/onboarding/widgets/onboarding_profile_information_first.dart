import 'package:auth/auth.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class OnboardingFirstProfileInformation extends StatelessWidget {
  const OnboardingFirstProfileInformation(
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
              const _ProfilePicture(),
              const SizedBox(height: Dimens.large),
              const _FirstNameAndLastName(),
              const SizedBox(height: Dimens.large),
              const _CountryDropdown(),
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

class _CountryDropdown extends StatelessWidget {
  const _CountryDropdown();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('¿Dónde vivis?'),
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
                child: DropdownButton<Countries>(
                  value: state.user.country == Countries.unknown
                      ? null
                      : state.user.country,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Padding(
                    padding: const EdgeInsets.all(Dimens.xSmall),
                    child: Text(
                      'Elegí tu país',
                      style: context.textTheme.bodySmall!.copyWith(
                        color: context.colorScheme.hintText,
                      ),
                    ),
                  ),
                  items: Countries.values
                      .where((country) => country != Countries.unknown)
                      .map((Countries country) {
                    return DropdownMenuItem<Countries>(
                      value: country,
                      child: Padding(
                        padding: const EdgeInsets.all(Dimens.xSmall),
                        child: Text(
                          country.name,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (Countries? newValue) {
                    context
                        .read<OnboardingCubit>()
                        .validateSecondFormPage(country: newValue);
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

class _FirstNameAndLastName extends StatelessWidget {
  const _FirstNameAndLastName();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OnboardingTextField(
              width: context.width * 0.2,
              label: 'Nombre',
              initialValue: state.user.firstName,
              hintText: 'Juan',
              onChanged: (value) => context
                  .read<OnboardingCubit>()
                  .validateSecondFormPage(firstName: value),
            ),
            SizedBox(width: context.width * 0.05),
            OnboardingTextField(
              width: context.width * 0.2,
              label: 'Apellido',
              initialValue: state.user.lastName,
              hintText: 'Perez',
              onChanged: (value) => context
                  .read<OnboardingCubit>()
                  .validateSecondFormPage(lastName: value),
            ),
          ],
        );
      },
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            try {
              final image = await FilePickerWeb.platform.pickFiles(
                type: FileType.image,
              );
              if (image != null) {
                context.read<OnboardingCubit>().validateSecondFormPage(
                      image: image.files.first.bytes,
                    );
              } else {
                throw Exception();
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: context.colorScheme.surface,
                  content: Text(
                    'No se selecciono ninguna imagen',
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: context.colorScheme.secondary,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              );
            }
          },
          child: Container(
            width: context.width * 0.1,
            height: context.width * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.tertiaryContainer,
            ),
            child: state.image == null
                ? Icon(
                    Icons.add_a_photo,
                    size: Dimens.xxLarge,
                    color: context.colorScheme.surface,
                  )
                : CircleAvatar(
                    backgroundImage: Image.memory(state.image!).image,
                    backgroundColor: Colors.transparent,
                  ),
          ),
        );
      },
    );
  }
}
