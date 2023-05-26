import 'package:flutter/material.dart';
import 'package:maasters/core/core.dart';

class ChangeAuthenticationView extends StatelessWidget {
  const ChangeAuthenticationView({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onTapAction,
  });

  final String questionText;
  final String actionText;
  final VoidCallback onTapAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: questionText,
          style: context.textTheme.bodySmall!.copyWith(
            color: context.colorScheme.onTertiaryContainer,
          ),
          children: [
            WidgetSpan(
              child: GestureDetector(
                onTap: onTapAction,
                child: Text(
                  actionText,
                  style: context.textTheme.bodySmall!.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            )
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
