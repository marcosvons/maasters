import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        child: LayoutBuilder(
          builder: (context, boxConstraints) {
            return Scaffold(
              appBar: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                  ? PreferredSize(
                      preferredSize: Size.fromHeight(context.height * 0.1),
                      child: const Header(),
                    )
                  : null,
              body: const LoginBody(),
            );
          },
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
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                    ? context.width * 0.1
                    : Dimens.medium,
              ),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                      ? context.width * 0.3
                      : context.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (boxConstraints.maxWidth < Resolutions.mobileMaxWidth)
                        Align(
                          child: SvgPicture.asset(
                            AppIcons.blueLogoMobile,
                            height: context.height * 0.3,
                          ),
                        ),
                      if (boxConstraints.maxWidth > Resolutions.mobileMaxWidth)
                        const _TitleAndSubtitle(),
                      const SizedBox(height: Dimens.xxLarge * 2),
                      GoogleSignIn(
                        onTap: () {
                          context.read<LoginCubit>().loginWithGoogle(
                                isWeb: boxConstraints.maxWidth >
                                    Resolutions.mobileMaxWidth,
                              );
                        },
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
            if (boxConstraints.maxWidth > Resolutions.mobileMaxWidth)
              BlueBox(
                title: context.l10n.registrationContainerTitle,
                subtitle: context.l10n.registrationContainerSubtitle,
              )
          ],
        );
      },
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
