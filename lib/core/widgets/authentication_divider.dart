import 'package:flutter/material.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/l10n/l10n.dart';

class DividerSignInMethod extends StatelessWidget {
  const DividerSignInMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.xSmall,
          ),
          child: Text(
            context.l10n.dividerSignInMethod,
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.surfaceTint,
            ),
          ),
        ),
        const Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
