import 'package:cupertino_ui/cupertino_ui.dart'
    show GlobalCupertinoLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalWidgetsLocalizations;
import 'package:material_ui/material_ui.dart';
import 'package:myapp/generated/l10n/app_localizations.dart' as al;
import 'package:myapp/src/router/coordinator.dart';

class S {
  static LocalizationsDelegate<al.AppLocalizations> get delegate =>
      al.AppLocalizations.delegate;

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
    al.AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
  static List<Locale> get supportedLocales =>
      al.AppLocalizations.supportedLocales;

  static al.AppLocalizations of(BuildContext context) {
    return al.AppLocalizations.of(context)!;
  }

  static al.AppLocalizations get text {
    return al.AppLocalizations.of(AppCoordinator.context)!;
  }
}
