import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          unauthenticated: () => Navigator.of(context)
              .pushReplacement<void, void>(SignUpPage.route()),
        );
      },
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: const Text('LOG OUT'),
            onPressed: () =>
                context.read<AuthBloc>().add(const AuthEvent.logoutRequested()),
          ),
        ),
      ),
    );
  }
}
