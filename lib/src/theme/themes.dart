import 'package:flutter/material.dart';
import 'package:myapp/src/theme/styles.dart';

import 'colors.dart';

class XTheme {
  static const String? fontFamily = null;

  static ThemeData light() => ThemeData(
        fontFamily: fontFamily,

        /// Colors
        primaryColor: XColors.primary,
        brightness: Brightness.light,
        textTheme: XStyles.textTheme,

        /// ColorScheme
        colorScheme: const ColorScheme.light(
          primary: XColors.primary,
        ),

        // Appbar
        appBarTheme: const AppBarTheme(
          // default system appbar icon is white
          backgroundColor: XColors.primary,
        ),

        /// input
        inputDecorationTheme: const InputDecorationTheme(),

        /// Button
        buttonTheme: const ButtonThemeData(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromHeight(50),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            fixedSize: const Size.fromHeight(50),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(),
        ),
        iconTheme: const IconThemeData(),
      );

  static ThemeData dark() => ThemeData.dark();
}
