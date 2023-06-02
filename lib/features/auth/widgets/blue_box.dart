import 'package:flutter/material.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/l10n/l10n.dart';

class BlueBox extends StatelessWidget {
  const BlueBox({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: context.height * 0.1),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.colorScheme.tertiary,
                context.colorScheme.primary,
              ],
            ),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 15),
                blurRadius: 10,
                color: Colors.black12,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.registrationContainerTitle,
                  style: context.textTheme.displayLarge!.copyWith(
                    color: context.colorScheme.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Dimens.small),
                Text(
                  context.l10n.registrationContainerSubtitle,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.colorScheme.secondary,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
