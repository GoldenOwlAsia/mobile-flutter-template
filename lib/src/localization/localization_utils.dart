import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as al;
import 'package:myapp/src/router/coordinator.dart';

// ignore: avoid_classes_with_only_static_members
class S {
  static get delegate => al.AppLocalizations.delegate;
  static al.AppLocalizations of(BuildContext context) {
    return al.AppLocalizations.of(context)!;
  }

  static al.AppLocalizations get text {
    return al.AppLocalizations.of(AppCoordinator.context)!;
  }
}
