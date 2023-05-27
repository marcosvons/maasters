import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          create: (context) =>
              SignUpCubit(authRepository: getIt<IAuthRepository>()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.whenOrNull(
                authenticated: (user) {
                  if (user.onboardingCompleted) {
                    Navigator.of(context)
                        .pushReplacement<void, void>(HomePage.route());
                  } else {
                    context.read<OnboardingCubit>().saveProgress(
                          user: user,
                          completed: 0,
                        );
                    Navigator.of(context)
                        .pushReplacement<void, void>(OnboardingPage.route());
                  }
                },
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(context.height * 0.1),
            child: const Header(),
          ),
          body: const SignUpBody(),
        ),
      ),
    );
  }
}

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
          child: SingleChildScrollView(
            child: SizedBox(
              width: context.width * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _TitleAndSubtitle(),
                  const SizedBox(height: Dimens.xxLarge * 2),
                  GoogleSignIn(
                    onTap: () => context.read<SignUpCubit>().signUpWithGoogle(),
                  ),
                  const SizedBox(height: Dimens.xxLarge),
                  const DividerSignInMethod(),
                  const SignUpForm(),
                  const SizedBox(height: Dimens.medium),
                  const _TermsAndConditions(),
                  const SizedBox(height: Dimens.xxLarge),
                  ChangeAuthenticationView(
                    questionText: '¿Ya tenés una cuenta? ',
                    actionText: 'Inicia sesión',
                    onTapAction: () =>
                        Navigator.of(context).pushReplacement<void, void>(
                      LoginPage.route(),
                    ),
                  ),
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
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
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
