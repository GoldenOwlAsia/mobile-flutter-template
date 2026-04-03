import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/generated/l10n/app_localizations.dart';

Widget buildTestableWidget(Widget child) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: child,
  );
}

Future<void> pumpTestableWidget(WidgetTester tester, Widget child) async {
  await tester.pumpWidget(buildTestableWidget(child));
  await tester.pumpAndSettle();
}
