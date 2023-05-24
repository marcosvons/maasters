import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';
import 'package:maasters/features/onboarding/views/onboarding_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) =>
          SignUpCubit(authRepository: getIt<IAuthRepository>()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            authenticated: (_) {
              Navigator.of(context)
                  .pushReplacement<void, void>(OnboardingPage.route());
            },
          );
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(context.height * 0.1),
            child: AppBar(
              toolbarHeight: context.height * 0.1,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    AppIcons.blueLogo,
                    height: context.height * 0.075,
                  ),
                ),
              ),
            ),
          ),
          body: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: context.width * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        _TitleAndSubtitle(),
                        SizedBox(height: Dimens.xxLarge * 2),
                        GoogleSignIn(),
                        SizedBox(height: Dimens.xxLarge),
                        _DividerSignInMethod(),
                        SignUpForm(),
                        SizedBox(height: Dimens.xxLarge),
                        _TermsAndConditions()
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: context.height * 0.1),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          context.colorScheme.tertiary,
                          context.colorScheme.primary,
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 15),
                          blurRadius: 10,
                          color: Colors.black12,
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.width * 0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Potencia tu crecimiento',
                            style: context.textTheme.displayLarge!.copyWith(
                              color: context.colorScheme.secondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: Dimens.small),
                          Text(
                            'Unite a la comunidad Latinoamericana para vincularte con expertos en la industria que quieras.',
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.secondary,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Al continuar usted acepta los ',
        style: context.textTheme.bodySmall!.copyWith(
          color: context.colorScheme.onTertiaryContainer,
        ),
        children: [
          TextSpan(
            text: 'Términos de Uso',
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          const TextSpan(text: ', '),
          TextSpan(
            text: 'Políticas de Privacidad',
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          const TextSpan(text: ' y '),
          TextSpan(
            text: 'Estándares de Comunidad',
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          const TextSpan(text: ' de MaaSters.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _DividerSignInMethod extends StatelessWidget {
  const _DividerSignInMethod();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.xSmall,
          ),
          child: Text(
            'OR',
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.surfaceTint,
            ),
          ),
        ),
        const Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}

class _TitleAndSubtitle extends StatelessWidget {
  const _TitleAndSubtitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bienvenido a MaaSters',
          style: context.textTheme.displayLarge,
        ),
        const SizedBox(height: Dimens.medium),
        Text(
          'Conectá con las personas indicadas para potenciar tus decisiones y habilidades profesionales.',
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.surface,
          ),
        ),
      ],
    );
  }
}
