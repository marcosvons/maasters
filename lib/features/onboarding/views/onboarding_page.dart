import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const OnboardingPage());
  }

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Align(
              child: SingleChildScrollView(
                child: _OnboardingProfileSelection(_pageController),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingProfileSelection extends StatelessWidget {
  const _OnboardingProfileSelection(PageController pageController)
      : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.small),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            children: [
              _ProfileSelectionButton(
                image: AppIcons.mentee,
                title: 'Ser mentoreado',
                profileDescription: Strings.menteeProfileDescription,
                profileType: ProfileType.mentee,
                onTap: () => context.read<OnboardingCubit>().saveProgress(
                      context.read<AuthBloc>().state.user!.copyWith(
                            profileType: ProfileType.mentee,
                          ),
                    ),
              ),
              SizedBox(width: context.width * 0.05),
              _ProfileSelectionButton(
                image: AppIcons.mentor,
                title: 'Ser mentor',
                profileType: ProfileType.mentor,
                profileDescription: Strings.mentorProfileDescription,
                onTap: () => context.read<OnboardingCubit>().saveProgress(
                      context.read<AuthBloc>().state.user!.copyWith(
                            profileType: ProfileType.mentor,
                          ),
                    ),
              ),
            ],
          ),
          const SizedBox(height: Dimens.xxLarge),
          BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) => Align(
              child: SizedBox(
                width: context.width * 0.25,
                height: context.height * 0.065,
                child: ElevatedButton(
                  style: state.maybeWhen(
                    orElse: () => ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        context.colorScheme.disabledButtonBackground,
                      ),
                    ),
                    onboardingInProgress: (user) => ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        context.colorScheme.primary,
                      ),
                    ),
                  ),
                  onPressed: () {
                    state.maybeWhen(
                      orElse: () {},
                      onboardingInProgress: (_) => _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      ),
                    );
                  },
                  child: Text(
                    'Continuar',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: state.maybeWhen(
                        orElse: () => context.colorScheme.surfaceTint,
                        onboardingInProgress: (_) =>
                            context.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileSelectionButton extends StatelessWidget {
  const _ProfileSelectionButton({
    required this.image,
    required this.title,
    required this.profileDescription,
    required this.profileType,
    required this.onTap,
  });

  final Map<int, String> profileDescription;
  final String image;
  final String title;
  final VoidCallback onTap;
  final ProfileType profileType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.3,
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
                border: state.maybeMap(
                  orElse: () =>
                      Border.all(color: context.colorScheme.secondary),
                  onboardingInProgress: (state) {
                    if (state.user.profileType == profileType) {
                      return Border.all(
                        color: context.colorScheme.primary,
                      );
                    }
                    return Border.all(
                      color: context.colorScheme.secondary,
                    );
                  },
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.xxLarge,
                  vertical: Dimens.xxLarge,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      image,
                      height: Dimens.xxLarge * 1.5,
                      width: Dimens.xxLarge * 1.5,
                    ),
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
            );
          },
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
