import 'package:flutter/material.dart';
import 'colors.dart';
import 'styles.dart';

/// Application theme configuration
/// Simple theme setup with essential customizations only
class AppTheme {
  AppTheme._();

  /// Default font family for the app
  static const String? fontFamily = null;

  /// Light theme with basic essential customizations
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        fontFamily: fontFamily,
        useMaterial3: true,

        // Primary colors
        primarySwatch: Colors.pink,
        primaryColor: AppColors.primary,

        // Background colors
        scaffoldBackgroundColor: AppColors.background,

        // Typography
        textTheme: AppStyles.textTheme,

        // Color scheme
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          error: AppColors.error,
          surface: AppColors.surface,
        ),

        // AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          elevation: 0,
          centerTitle: false,
        ),

        // Elevated buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textOnPrimary,
            minimumSize: const Size(0, 48),
          ),
        ),

        // Input decoration
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      );

  /// Dark theme (same as light for now)
  static ThemeData dark() => light().copyWith(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          error: AppColors.error,
        ),
      );

  /// Get current theme brightness
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
