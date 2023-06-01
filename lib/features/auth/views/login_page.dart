import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';
import 'package:maasters/l10n/l10n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) =>
              LoginCubit(authRepository: getIt<IAuthRepository>()),
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
          body: const LoginBody(),
        ),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({
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
                  const SizedBox(height: Dimens.xxLarge),
                  GoogleSignIn(
                    onTap: () => context.read<LoginCubit>().loginWithGoogle(),
                  ),
                  const SizedBox(height: Dimens.xxLarge),
                  const DividerSignInMethod(),
                  const SizedBox(height: Dimens.large),
                  const LoginForm(),
                  const SizedBox(height: Dimens.large),
                  ChangeAuthenticationView(
                    questionText: context.l10n.dontHaveAccount,
                    actionText: context.l10n.signUp,
                    onTapAction: () => Navigator.of(context)
                        .pushReplacement<void, void>(SignUpPage.route()),
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
                      context.l10n.registrationContainerTitle,
                      style: context.textTheme.displayLarge!.copyWith(
                        color: context.colorScheme.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Dimens.small),
                    Text(
                      context.l10n.registrationContainerSubtitle,
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

class _TitleAndSubtitle extends StatelessWidget {
  const _TitleAndSubtitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.welcomeMaaster,
          style: context.textTheme.displayLarge,
        ),
        const SizedBox(height: Dimens.medium),
        Text(
          context.l10n.welcomeMaasterSubtitle,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.surface,
          ),
        ),
      ],
    );
  }
}
