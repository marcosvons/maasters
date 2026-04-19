import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: context.colorScheme.primary,
      toolbarHeight: context.height * 0.1,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: state.maybeWhen(
                orElse: () => MainAxisAlignment.start,
                authenticated: (_) => MainAxisAlignment.spaceBetween,
              ),
              children: [
                SvgPicture.asset(
                  AppIcons.blueLogoMobile,
                  height: context.height * 0.075,
                ),
                state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  authenticated: (user) => user.onboardingCompleted
                      ? LayoutBuilder(
                          builder: (context, boxConstraints) {
                            return Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      context.colorScheme.onTertiary,
                                  child: SvgPicture.asset(
                                    boxConstraints.maxWidth >
                                            Resolutions.mobileMaxWidth
                                        ? AppIcons.messages
                                        : AppIcons.messagesMobile,
                                    height: Dimens.large,
                                  ),
                                ),
                                const SizedBox(width: Dimens.medium),
                                CircleAvatar(
                                  backgroundColor:
                                      context.colorScheme.onTertiary,
                                  child: SvgPicture.asset(
                                    boxConstraints.maxWidth >
                                            Resolutions.mobileMaxWidth
                                        ? AppIcons.notifications
                                        : AppIcons.notificationsMobile,
                                    height: Dimens.large,
                                  ),
                                ),
                                const SizedBox(width: Dimens.medium),
                                CircleAvatar(
                                  radius: context.height * 0.03,
                                  backgroundImage: user.photoUrl.isNotEmpty
                                      ? NetworkImage(user.photoUrl)
                                      : null,
                                  backgroundColor: context.colorScheme.tertiary,
                                  child: user.photoUrl.isEmpty
                                      ? Text(
                                          user.firstName[0],
                                          style: context
                                              .textTheme.displayMedium!
                                              .copyWith(
                                            color:
                                                context.colorScheme.secondary,
                                          ),
                                        )
                                      : null,
                                ),
                              ],
                            );
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.logout,
                            color: context.colorScheme.primary,
                          ),
                          onPressed: () => context
                              .read<AuthBloc>()
                              .add(const AuthEvent.logoutRequested()),
                        ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
