import 'package:flutter/material.dart';

import 'colors.dart';

/// Application text styles following Material Design 3 typography system
/// Provides comprehensive text styling with consistent spacing and hierarchy
class AppStyles {
  // Private constructor to prevent instantiation
  AppStyles._();

  // MARK: - Display Styles (Largest text, short and impactful)
  /// Display Large - 57sp, used for large headlines
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
    color: AppColors.text,
  );

  /// Display Medium - 45sp, used for prominent headlines
  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
    color: AppColors.text,
  );

  /// Display Small - 36sp, used for section headers
  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
    color: AppColors.text,
  );

  // MARK: - Headline Styles (High-emphasis text for important content)
  /// Headline Large - 32sp
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.25,
    color: AppColors.text,
  );

  /// Headline Medium - 28sp
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.29,
    color: AppColors.text,
  );

  /// Headline Small - 24sp
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.33,
    color: AppColors.text,
  );

  // MARK: - Title Styles (Medium-emphasis text for structure)
  /// Title Large - 22sp, used for card titles, toolbar titles
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.27,
    color: AppColors.text,
  );

  /// Title Medium - 16sp, used for prominent text in components
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.50,
    color: AppColors.text,
  );

  /// Title Small - 14sp, used for smaller headings
  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: AppColors.text,
  );

  // MARK: - Label Styles (Smaller utility text)
  /// Label Large - 14sp, used for button text, tab labels
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: AppColors.text,
  );

  /// Label Medium - 12sp, used for smaller buttons, badges
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
    color: AppColors.text,
  );

  /// Label Small - 11sp, used for tiny labels, captions
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
    color: AppColors.text,
  );

  // MARK: - Body Styles (Readable text for long-form writing)
  /// Body Large - 16sp, used for longer texts, article content
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
    color: AppColors.text,
  );

  /// Body Medium - 14sp, used for standard body text
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
    color: AppColors.text,
  );

  /// Body Small - 12sp, used for captions, supporting text
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    color: AppColors.textSecondary,
  );

  // MARK: - Custom App-Specific Styles
  /// Button text style
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: AppColors.textOnPrimary,
  );

  /// Input field text style
  static const TextStyle input = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
    color: AppColors.text,
  );

  /// Placeholder text style
  static const TextStyle placeholder = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
    color: AppColors.textSecondary,
  );

  /// Error text style
  static const TextStyle error = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    color: AppColors.error,
  );

  /// Success text style
  static const TextStyle success = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    color: AppColors.success,
  );

  /// Link text style
  static const TextStyle link = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
    color: AppColors.link,
    decoration: TextDecoration.underline,
  );

  /// Code text style (monospace)
  static const TextStyle code = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.43,
    color: AppColors.text,
    fontFamily: 'monospace',
  );

  // MARK: - Material Design 3 TextTheme
  /// Complete Material Design 3 text theme
  static TextTheme get textTheme => const TextTheme(
        // Display styles
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,

        // Headline styles
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,

        // Title styles
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,

        // Label styles
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,

        // Body styles
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
      );

  // MARK: - Style Variants Helper Methods
  /// Create a variant of any text style with different color
  static TextStyle withColor(TextStyle baseStyle, Color color) {
    return baseStyle.copyWith(color: color);
  }

  /// Create a variant of any text style with different font weight
  static TextStyle withWeight(TextStyle baseStyle, FontWeight weight) {
    return baseStyle.copyWith(fontWeight: weight);
  }

  /// Create a variant of any text style with different size
  static TextStyle withSize(TextStyle baseStyle, double size) {
    return baseStyle.copyWith(fontSize: size);
  }

  /// Create a variant of any text style with decoration
  static TextStyle withDecoration(
    TextStyle baseStyle,
    TextDecoration decoration,
  ) {
    return baseStyle.copyWith(decoration: decoration);
  }
}
