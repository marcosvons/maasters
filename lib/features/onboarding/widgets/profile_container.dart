import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class ProfileSelectionButton extends StatelessWidget {
  const ProfileSelectionButton({
    super.key,
    required this.image,
    required this.title,
    required this.profileDescription,
    required this.profileType,
    required this.onTap,
    required this.constraints,
  });

  final Map<int, String> profileDescription;
  final String image;
  final String title;
  final VoidCallback onTap;
  final ProfileType profileType;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth > Resolutions.mobileMaxWidth
          ? context.width * 0.3
          : context.width * 0.9,
      child: GestureDetector(
        onTap: onTap,
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: Dimens.xSmall,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(Dimens.large),
                border: state.user.profileType == profileType
                    ? Border.all(
                        color: context.colorScheme.primary,
                      )
                    : Border.all(
                        color: context.colorScheme.secondary,
                      ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.xxLarge,
                  vertical: Dimens.xxLarge,
                ),
                child: Column(
                  children: [
                    if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                      Column(
                        children: profileTypeImageAndText(
                          context,
                          constraints,
                          image,
                          title,
                        ),
                      )
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: profileTypeImageAndText(
                          context,
                          constraints,
                          image,
                          title,
                        ),
                      ),
                    const SizedBox(height: Dimens.medium),
                    const Divider(),
                    const SizedBox(height: Dimens.medium),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ProfileDescription(
                          text: profileDescription[0]!,
                        ),
                        const SizedBox(height: Dimens.medium),
                        _ProfileDescription(
                          text: profileDescription[1]!,
                        ),
                        const SizedBox(height: Dimens.medium),
                        _ProfileDescription(
                          text: profileDescription[2]!,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<Widget> profileTypeImageAndText(
  BuildContext context,
  BoxConstraints constraints,
  String image,
  String title,
) {
  return [
    SvgPicture.asset(
      image,
      height: Dimens.xxLarge * 1.5,
      width: Dimens.xxLarge * 1.5,
    ),
    const SizedBox(
      height: Dimens.medium,
      width: Dimens.medium,
    ),
    Text(
      title,
      style: context.textTheme.displaySmall!.copyWith(
        color: context.colorScheme.onSecondary,
        fontSize: 18,
      ),
    ),
  ];
}

class _ProfileDescription extends StatelessWidget {
  const _ProfileDescription({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check,
          color: context.colorScheme.onTertiaryContainer,
          size: Dimens.medium,
        ),
        const SizedBox(width: Dimens.xxSmall),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.onTertiaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
