import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/auth/auth.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: context.width * 0.3,
        height: context.height * 0.075,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimens.xSmall),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: Dimens.xSmall,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: context.colorScheme.onTertiaryContainer,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: context.height * 0.05,
              height: context.height * 0.05,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimens.xSmall),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.googleLogo,
                  width: context.height * 0.03,
                  height: context.height * 0.03,
                ),
              ),
            ),
            const SizedBox(width: Dimens.small),
            Text(
              'Continuar con Google',
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      onTap: () => context.read<SignUpCubit>().signUpWithGoogle(),
    );
  }
}
