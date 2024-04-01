import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as al;
import 'package:myapp/src/router/coordinator.dart';

class S {
  static get delegate => al.AppLocalizations.delegate;
  static get localizationsDelegates =>
      al.AppLocalizations.localizationsDelegates;
  static get supportedLocales => al.AppLocalizations.supportedLocales;

  static al.AppLocalizations of(BuildContext context) {
    return al.AppLocalizations.of(context)!;
  }

  static al.AppLocalizations get text {
    return al.AppLocalizations.of(AppCoordinator.context)!;
  }
}
