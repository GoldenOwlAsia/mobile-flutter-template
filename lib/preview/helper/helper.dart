// Custom widget wrapper for common state previews
import 'package:flutter/material.dart';
import 'package:myapp/src/localization/localization_utils.dart';

Widget commonScaffoldWrapper(Widget child) {
  return MaterialApp(
    localizationsDelegates: S.localizationsDelegates,
    supportedLocales: S.supportedLocales,
    theme: ThemeData.light(),
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    ),
  );
}

// Custom widget wrapper for button previews
Widget commonContainerWrapper(Widget child) {
  return Container(
    color: Colors.grey[100],
    padding: const EdgeInsets.all(24.0),
    child: child,
  );
}

class PreviewGroups {
  static const String commonStates = 'Common States';
  static const String buttons = 'Buttons';
  static const String forms = 'Forms';
}
