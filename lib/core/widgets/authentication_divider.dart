import 'package:flutter/material.dart';
import 'package:maasters/core/core.dart';

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
            'O',
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
