import 'package:flutter/material.dart';

/// Application color constants following Material Design 3 principles
/// Colors are organized by category and follow consistent naming conventions
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // MARK: - Primary Brand Colors
  /// Main brand color - bright pink
  static const Color primary = Color(0xFFE91E63); // More standard pink
  static const Color primaryLight = Color(0xFFF48FB1);
  static const Color primaryDark = Color(0xFFC2185B);

  /// Secondary brand color for accents
  static const Color secondary = Color(0xFF2196F3);
  static const Color secondaryLight = Color(0xFF90CAF9);
  static const Color secondaryDark = Color(0xFF1976D2);

  // MARK: - Text Colors
  /// Primary text color for headings and important content
  static const Color text = Color(0xFF212121);
  static Color get textPrimary => text;

  /// Secondary text color for body text and descriptions
  static const Color textSecondary = Color(0xFF757575);

  /// Disabled text color
  static const Color textDisabled = Color(0xFFBDBDBD);

  /// Text on primary color backgrounds
  static const Color textOnPrimary = Colors.white;

  /// Hyperlink color
  static const Color link = Color(0xFF1976D2);

  /// Link color when pressed
  static const Color linkPressed = Color(0xFF0D47A1);

  // MARK: - Background Colors
  /// Main scaffold background
  static const Color background = Color(0xFFFAFAFA);

  /// Surface color for cards and elevated components
  static const Color surface = Colors.white;

  /// Alternative surface color
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  // MARK: - Semantic Colors
  /// Success color for positive actions and states
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFFC8E6C9);

  /// Warning color for caution states
  static const Color warning = Color(0xFFFF9800);
  static const Color warningLight = Color(0xFFFFE0B2);

  /// Error color for negative states and validation
  static const Color error = Color(0xFFF44336);
  static const Color errorLight = Color(0xFFFFCDD2);

  /// Info color for informational content
  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFFE3F2FD);

  // MARK: - Neutral Colors
  /// Pure black - use sparingly
  static const Color black = Color(0xFF000000);

  /// Dark neutral for text and icons
  static const Color neutral900 = Color(0xFF212121);
  static const Color neutral800 = Color(0xFF424242);
  static const Color neutral700 = Color(0xFF616161);
  static const Color neutral600 = Color(0xFF757575);
  static const Color neutral500 = Color(0xFF9E9E9E);
  static const Color neutral400 = Color(0xFFBDBDBD);
  static const Color neutral300 = Color(0xFFE0E0E0);
  static const Color neutral200 = Color(0xFFEEEEEE);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral50 = Color(0xFFFAFAFA);

  /// Pure white
  static const Color white = Color(0xFFFFFFFF);

  // MARK: - Component Specific Colors
  /// Divider color for separating content
  static const Color divider = Color(0xFFE0E0E0);

  /// Border color for input fields and containers
  static const Color border = Color(0xFFE0E0E0);

  /// Focus color for interactive elements
  static const Color focus = Color(0xFF2196F3);

  /// Hover color for interactive elements
  static const Color hover = Color(0x0F000000); // 6% black overlay
  /// Pressed state color
  static const Color pressed = Color(0x1F000000); // 12% black overlay
  /// Disabled state color
  static const Color disabled = Color(0xFFE0E0E0);

  // MARK: - Shadow Colors
  /// Light shadow for elevated components
  static const Color shadowLight = Color(0x1F000000);

  /// Medium shadow for more prominent elevation
  static const Color shadowMedium = Color(0x3D000000);

  /// Dark shadow for high elevation components
  static const Color shadowDark = Color(0x5C000000);
}
