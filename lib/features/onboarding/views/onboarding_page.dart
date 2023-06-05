import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingCubit>(
          create: (context) =>
              OnboardingCubit(user: context.read<AuthBloc>().state.user!),
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            unauthenticated: (_) => Navigator.of(context)
                .pushReplacement<void, void>(SignUpPage.route()),
          );
        },
        child: LayoutBuilder(
          builder: (context, boxConstraints) {
            return Scaffold(
              appBar: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                  ? PreferredSize(
                      preferredSize: Size.fromHeight(context.height * 0.1),
                      child: const Header(),
                    )
                  : null,
              body: SafeArea(
                bottom: false,
                child: BlocBuilder<OnboardingCubit, OnboardingState>(
                  builder: (context, state) {
                    return PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        OnboardingProfileSelection(_pageController),
                        OnboardingFirstProfileInformation(_pageController),
                        OnboardingSecondProfileInformation(_pageController),
                        OnboardingProfessionalInformation(_pageController),
                        if (state.user.profileType == ProfileType.mentee)
                          OnboardingObjective(_pageController),
                        OnboardingDescription(_pageController),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
