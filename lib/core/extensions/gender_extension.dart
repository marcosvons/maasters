import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:maasters/l10n/l10n.dart';

extension GenderX on Gender {
  String translatedGender(BuildContext context) {
    switch (this) {
      case Gender.male:
        return context.l10n.male;
      case Gender.female:
        return context.l10n.female;
      case Gender.notSpecified:
        return context.l10n.notSpecified;
      default:
        return '';
    }
  }
}
