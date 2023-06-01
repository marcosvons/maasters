import 'package:flutter/material.dart';
import 'package:maasters/core/core.dart';

class OnboardingTextField extends StatelessWidget {
  const OnboardingTextField({
    super.key,
    required this.width,
    required this.label,
    required this.initialValue,
    required this.hintText,
    required this.onChanged,
    this.readOnly = false,
  });

  final double width;
  final bool readOnly;
  final String label;
  final String initialValue;
  final String hintText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: Dimens.medium),
        SizedBox(
          width: width,
          child: TextFormField(
            readOnly: readOnly,
            initialValue: initialValue,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.xSmall),
                borderSide: BorderSide(
                  color: context.colorScheme.inputBorder,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.xSmall),
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                  width: 2,
                ),
              ),
              hintText: hintText,
              hintStyle: context.textTheme.bodySmall!.copyWith(
                color: context.colorScheme.hintText,
              ),
              filled: true,
              fillColor: context.colorScheme.tertiaryContainer,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
