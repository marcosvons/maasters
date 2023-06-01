import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:maasters/l10n/l10n.dart';

extension ObjectiveX on Objective {
  String translatedObjective(BuildContext context) {
    switch (this) {
      case Objective.findJob:
        return context.l10n.findJob;
      case Objective.learn:
        return context.l10n.learn;
      case Objective.network:
        return context.l10n.network;
      case Objective.grow:
        return context.l10n.grow;
      case Objective.change:
        return context.l10n.changeCareer;
      case Objective.notSure:
        return context.l10n.notSure;
    }
  }
}
