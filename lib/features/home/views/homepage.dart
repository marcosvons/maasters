import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/features/auth/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //route to Homepage
  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: ElevatedButton(
          child: const Text('Logout'),
          onPressed: () =>
              context.read<AuthBloc>().add(const AuthEvent.logoutRequested()),
        ),
      ),
    );
  }
}
