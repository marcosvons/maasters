import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const OnboardingPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          unauthenticated: (_) => Navigator.of(context)
              .pushReplacement<void, void>(SignUpPage.route()),
        );
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.height * 0.1),
          child: const Header(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '¿Qué deseas hacer en MaaSters?',
                style: context.textTheme.displayLarge,
              ),
              const SizedBox(height: Dimens.medium),
              Text(
                'Vas a poder conectarte con el mejor talento emergente de Latinoamerica',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colorScheme.surface,
                ),
              ),
              const SizedBox(height: Dimens.xxLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _ProfileSelectionButton(
                    image: AppIcons.mentee,
                    title: 'Ser mentoreado',
                    profileDescription: Strings.menteeProfileDescription,
                  ),
                  SizedBox(width: Dimens.xLarge),
                  _ProfileSelectionButton(
                    image: AppIcons.mentor,
                    title: 'Ser mentor',
                    profileDescription: Strings.mentorProfileDescription,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileSelectionButton extends StatelessWidget {
  const _ProfileSelectionButton({
    required this.image,
    required this.title,
    required this.profileDescription,
  });

  final Map<int, String> profileDescription;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
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
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.xxLarge,
            vertical: Dimens.xxLarge,
          ),
          child: Column(
            children: [
              SvgPicture.asset(image),
              const SizedBox(height: Dimens.medium),
              Text(
                title,
                style: context.textTheme.displaySmall!.copyWith(
                  color: context.colorScheme.onSecondary,
                  fontSize: 18,
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
      ),
    );
  }
}

class _ProfileDescription extends StatelessWidget {
  const _ProfileDescription({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.check,
              color: context.colorScheme.onTertiaryContainer,
              size: Dimens.medium,
            ),
          ),
          const WidgetSpan(
            child: SizedBox(width: Dimens.xxSmall),
          ),
          TextSpan(
            text: text,
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.onTertiaryContainer,
            ),
          ),
        ],
        style: context.textTheme.bodyMedium!.copyWith(
          color: context.colorScheme.onSecondary,
        ),
      ),
    );
  }
}
