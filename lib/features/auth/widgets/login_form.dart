import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';
import 'package:maasters/l10n/l10n.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state.status == FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: context.colorScheme.error,
              content: Text(
                state.failure == const AuthFailure.userNotFoundError()
                    ? context.l10n.userNotFoundError
                    : state.failure ==
                            const AuthFailure.invalidCredentialsError()
                        ? context.l10n.wrongPassword
                        : context.l10n.generalAuthError,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: context.colorScheme.secondary,
                ),
              ),
            ),
          );
          context.read<LoginCubit>().restartLogin();
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.email,
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: Dimens.medium),
              TextFormField(
                initialValue: state.email.value,
                onChanged: (value) =>
                    context.read<LoginCubit>().emailChanged(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimens.xSmall),
                    borderSide: BorderSide(
                      color: context.colorScheme.onTertiaryContainer,
                    ),
                  ),
                  filled: true,
                  fillColor: context.colorScheme.tertiaryContainer,
                ),
              ),
              const SizedBox(height: Dimens.medium),
              Text(
                context.l10n.password,
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: Dimens.medium),
              TextFormField(
                onChanged: (value) =>
                    context.read<LoginCubit>().passwordChanged(value),
                obscureText: !state.showPassword,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    child: Icon(
                      state.showPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onTap: () =>
                        context.read<LoginCubit>().passwordVisibilityChanged(),
                  ),
                  errorMaxLines: 4,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimens.xSmall),
                    borderSide: BorderSide(
                      color: context.colorScheme.onTertiaryContainer,
                    ),
                  ),
                  filled: true,
                  fillColor: context.colorScheme.tertiaryContainer,
                ),
              ),
              // const SizedBox(height: Dimens.medium),
              const SizedBox(height: Dimens.xxLarge),
              SizedBox(
                width: context.width * 0.3,
                height: context.height * 0.075,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<LoginCubit>().loginWithEmailAndPassword();
                  },
                  child: (state.status == FormzSubmissionStatus.inProgress ||
                              state.status == FormzSubmissionStatus.success) &&
                          context.read<AuthBloc>().state ==
                              const AuthState.unauthenticated()
                      ? CircularProgressIndicator(
                          color: context.colorScheme.secondary,
                        )
                      : Text(
                          context.l10n.logIn,
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
