import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';
import 'package:maasters/l10n/l10n.dart';

class OnboardingDescription extends StatelessWidget {
  const OnboardingDescription(PageController pageController, {super.key})
      : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeMap(
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
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => _DescriptionBody(pageController: _pageController),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            success: (_) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

class _DescriptionBody extends StatelessWidget {
  const _DescriptionBody({
    required PageController pageController,
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
              return LayoutBuilder(
                builder: (context, boxConstraints) {
                  return SizedBox(
                    width: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                        ? context.width * 0.45
                        : context.width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.descriptionTitle,
                          style: boxConstraints.maxWidth >
                                  Resolutions.mobileMaxWidth
                              ? context.textTheme.displayLarge
                              : context.textTheme.displayMedium,
                          textAlign: boxConstraints.maxWidth >
                                  Resolutions.mobileMaxWidth
                              ? TextAlign.start
                              : TextAlign.center,
                        ),
                        const SizedBox(height: Dimens.medium),
                        Text(
                          '${context.l10n.descriptionSubtitle} ${state.user.profileType == ProfileType.mentor ? context.l10n.descriptionSubtitleMentor : context.l10n.descriptionSubtitleMentee}',
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: context.colorScheme.surface,
                          ),
                        ),
                        const SizedBox(height: Dimens.xxLarge * 2),
                        const _DescriptionTextField(),
                        const SizedBox(height: Dimens.xxLarge * 2),
                        OnboardingNextButton(pageController: _pageController),
                        const SizedBox(height: Dimens.medium),
                        OnboardingBackButton(pageController: _pageController),
                      ],
                    ),
                  );
                },
              );
            },
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
        BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return TextFormField(
              initialValue: state.user.description,
              onChanged: (value) => context
                  .read<OnboardingCubit>()
                  .validateDescription(description: value),
              decoration: InputDecoration(
                hintText: context.l10n.descriptionHint,
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
            );
          },
        ),
      ],
    );
  }
}
