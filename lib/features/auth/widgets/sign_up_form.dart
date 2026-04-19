import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';
import 'package:maasters/l10n/l10n.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) async {
        if (state.status == FormzSubmissionStatus.failure) {
          //show snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: context.colorScheme.error,
              content: Text(
                state.failure == const AuthFailure.emailAlreadyExistsError()
                    ? context.l10n.emailAlreadyExistsError
                    : state.failure.toString(),
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: context.colorScheme.secondary,
                ),
              ),
            ),
          );
          context.read<SignUpCubit>().restartSignIn();
          await _pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInBack,
          );
        }
      },
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 200,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.email,
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: Dimens.medium),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          initialValue: state.email.value,
                          onChanged: (value) =>
                              context.read<SignUpCubit>().emailChanged(value),
                          decoration: InputDecoration(
                            hintText: context.l10n.emailHintText,
                            hintStyle: context.textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.onTertiaryContainer,
                            ),
                            errorText: state.isEmailValid != null &&
                                    !state.isEmailValid! &&
                                    state.email.isNotValid
                                ? context.l10n.invalidEmail
                                : null,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimens.xSmall),
                              borderSide: BorderSide(
                                color: context.colorScheme.onTertiaryContainer,
                              ),
                            ),
                            filled: true,
                            fillColor: context.colorScheme.tertiaryContainer,
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.email.isNotValid
                                    ? context.colorScheme.error
                                    : context.colorScheme.onTertiaryContainer,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: Dimens.medium),
                        const Text(''),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.password,
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: Dimens.medium),
                        TextFormField(
                          onChanged: (value) => context
                              .read<SignUpCubit>()
                              .passwordChanged(value),
                          obscureText: !state.showPassword,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              child: Icon(
                                state.showPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                              onTap: () => context
                                  .read<SignUpCubit>()
                                  .passwordVisibilityChanged(),
                            ),
                            errorText: state.isPasswordValid != null &&
                                    !state.isPasswordValid! &&
                                    state.password.isNotValid
                                ? context.l10n.invalidPassword
                                : null,
                            errorMaxLines: 4,
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.password.isNotValid
                                    ? context.colorScheme.error
                                    : context.colorScheme.onTertiaryContainer,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimens.xSmall),
                              borderSide: BorderSide(
                                color: context.colorScheme.onTertiaryContainer,
                              ),
                            ),
                            filled: true,
                            fillColor: context.colorScheme.tertiaryContainer,
                          ),
                        ),
                        const SizedBox(height: Dimens.medium),
                        Align(
                          child: GestureDetector(
                            onTap: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeOut,
                              );
                            },
                            child: Text(
                              context.l10n.changeEmail,
                              style: context.textTheme.bodySmall!.copyWith(
                                color: context.colorScheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              LayoutBuilder(
                builder: (context, boxConstraints) {
                  return SizedBox(
                    width: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                        ? context.width * 0.3
                        : context.width * 0.9,
                    height: context.height * 0.075,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageController.page == 0) {
                          context.read<SignUpCubit>().validateEmail();
                          if (state.email.isValid) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          }
                        }
                        if (_pageController.page == 1) {
                          context.read<SignUpCubit>().validatePassword();
                          if (state.password.isValid) {
                            //show snackbar with message
                            context
                                .read<SignUpCubit>()
                                .signUpWithEmailAndPassword();
                          }
                        }
                      },
                      child:
                          (state.status == FormzSubmissionStatus.inProgress ||
                                      state.status ==
                                          FormzSubmissionStatus.success) &&
                                  context.read<AuthBloc>().state ==
                                      const AuthState.unauthenticated()
                              ? CircularProgressIndicator(
                                  color: context.colorScheme.secondary,
                                )
                              : Text(
                                  context.l10n.continueText,
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    color: context.colorScheme.onPrimary,
                                  ),
                                ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
