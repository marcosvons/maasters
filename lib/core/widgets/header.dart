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
                  AppIcons.blueLogo,
                  height: context.height * 0.075,
                ),
                state.maybeWhen(
                  orElse: SizedBox.shrink,
                  authenticated: (_) => IconButton(
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
