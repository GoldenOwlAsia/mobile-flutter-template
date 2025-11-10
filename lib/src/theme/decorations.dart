import 'package:flutter/material.dart';
import 'colors.dart';

/// Application decoration constants for consistent UI styling
/// Includes shadows, borders, input decorations, and container decorations
class AppDecorations {
  // Private constructor to prevent instantiation
  AppDecorations._();

  // MARK: - Shadow Styles
  /// Light shadow for subtle elevation
  static final List<BoxShadow> shadowLight = [
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
      color: AppColors.shadowLight,
    ),
  ];

  /// Medium shadow for standard elevation
  static final List<BoxShadow> shadowMedium = [
    BoxShadow(
      offset: const Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 0,
      color: AppColors.shadowMedium,
    ),
  ];

  /// Strong shadow for high elevation components
  static final List<BoxShadow> shadowStrong = [
    BoxShadow(
      offset: const Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
      color: AppColors.shadowDark,
    ),
  ];

  /// Card shadow for elevated surfaces
  static final List<BoxShadow> shadowCard = [
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
      color: AppColors.shadowLight,
    ),
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
      color: AppColors.shadowLight,
    ),
  ];

  /// Modal shadow for overlays and dialogs
  static final List<BoxShadow> shadowModal = [
    BoxShadow(
      offset: const Offset(0, 8),
      blurRadius: 24,
      spreadRadius: 0,
      color: AppColors.shadowMedium,
    ),
  ];

  // MARK: - Border Radius
  /// Extra small border radius (4px)
  static const BorderRadius radiusXS = BorderRadius.all(Radius.circular(4));

  /// Small border radius (8px)
  static const BorderRadius radiusS = BorderRadius.all(Radius.circular(8));

  /// Medium border radius (12px)
  static const BorderRadius radiusM = BorderRadius.all(Radius.circular(12));

  /// Large border radius (16px)
  static const BorderRadius radiusL = BorderRadius.all(Radius.circular(16));

  /// Extra large border radius (24px)
  static const BorderRadius radiusXL = BorderRadius.all(Radius.circular(24));

  /// Circular border radius (999px)
  static const BorderRadius radiusCircular =
      BorderRadius.all(Radius.circular(999));

  // MARK: - Border Styles
  /// Default border for containers
  static const Border borderDefault = Border.fromBorderSide(
    BorderSide(color: AppColors.border, width: 1),
  );

  /// Focused border for interactive elements
  static const Border borderFocused = Border.fromBorderSide(
    BorderSide(color: AppColors.focus, width: 2),
  );

  /// Error border for validation states
  static const Border borderError = Border.fromBorderSide(
    BorderSide(color: AppColors.error, width: 1),
  );

  /// Success border for positive states
  static const Border borderSuccess = Border.fromBorderSide(
    BorderSide(color: AppColors.success, width: 1),
  );

  // MARK: - Container Decorations
  /// Standard card decoration
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: AppColors.surface,
        borderRadius: radiusM,
        boxShadow: shadowCard,
        border: Border.all(color: AppColors.border),
      );

  /// Elevated card decoration
  static BoxDecoration get cardElevatedDecoration => BoxDecoration(
        color: AppColors.surface,
        borderRadius: radiusM,
        boxShadow: shadowMedium,
      );

  /// Modal decoration for dialogs and bottom sheets
  static BoxDecoration get modalDecoration => BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: shadowModal,
      );

  /// Button decoration
  static BoxDecoration get buttonDecoration => BoxDecoration(
        color: AppColors.primary,
        borderRadius: radiusS,
        boxShadow: shadowLight,
      );

  /// Outlined button decoration
  static BoxDecoration get buttonOutlinedDecoration => BoxDecoration(
        color: Colors.transparent,
        borderRadius: radiusS,
        border: Border.all(color: AppColors.primary, width: 1),
      );

  // MARK: - Input Decorations
  /// Standard input field decoration
  static InputDecoration get inputDefault => InputDecoration(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: radiusS,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusS,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusS,
          borderSide: const BorderSide(color: AppColors.focus, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radiusS,
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: radiusS,
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: TextStyle(color: AppColors.textSecondary),
      );

  /// Input field with no border
  static const InputDecoration inputNoBorder = InputDecoration(
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );

  /// Underline input decoration
  static InputDecoration get inputUnderline => InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.focus, width: 2),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        hintStyle: TextStyle(color: AppColors.textSecondary),
      );

  /// Search input decoration
  static InputDecoration get inputSearch => InputDecoration(
        filled: true,
        fillColor: AppColors.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: radiusCircular,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusCircular,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusCircular,
          borderSide: const BorderSide(color: AppColors.focus, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        hintText: 'Search...',
        hintStyle: TextStyle(color: AppColors.textSecondary),
        prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
      );

  // MARK: - Gradient Decorations
  /// Primary gradient for buttons and backgrounds
  static const LinearGradient gradientPrimary = LinearGradient(
    colors: [AppColors.primary, AppColors.primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Secondary gradient
  static const LinearGradient gradientSecondary = LinearGradient(
    colors: [AppColors.secondary, AppColors.secondaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Success gradient
  static const LinearGradient gradientSuccess = LinearGradient(
    colors: [AppColors.success, Color(0xFF388E3C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Shimmer gradient for loading states
  static const LinearGradient gradientShimmer = LinearGradient(
    colors: [
      Color(0xFFE0E0E0),
      Color(0xFFF5F5F5),
      Color(0xFFE0E0E0),
    ],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
