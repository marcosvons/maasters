import 'dart:ui';

import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';
import 'package:maasters/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authRepository: getIt<IAuthRepository>(),
          ),
        ),
        BlocProvider<OnboardingCubit>(
          create: (context) =>
              OnboardingCubit(authRepository: getIt<IAuthRepository>()),
        )
      ],
      child: const AppStartUp(),
    );
  }
}

class AppStartUp extends StatelessWidget {
  const AppStartUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return MaterialApp(
          scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
          theme: ThemeManager.light,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: state.when(
            authenticated: (user) {
              if (user.onboardingCompleted) {
                return const HomePage();
              } else {
                return const OnboardingPage();
              }
            },
            unauthenticated: (_) {
              return const SignUpPage();
            },
          ),
        );
      },
    );
  }
}

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };
}
