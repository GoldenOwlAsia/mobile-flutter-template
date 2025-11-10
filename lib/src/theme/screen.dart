import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Screen utilities and responsive design helpers
/// Provides comprehensive screen information and responsive design methods
class AppScreens {
  // Private constructor to prevent instantiation
  const AppScreens._();

  /// MediaQuery data - must be initialized in main app
  static late MediaQueryData _mediaQuery;

  /// Initialize screen data with MediaQuery context
  static void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
  }

  // MARK: - Basic Screen Properties
  /// The number of device pixels for each logical pixel
  static double get scale => _mediaQuery.devicePixelRatio;

  /// Screen width in logical pixels
  static double get width => _mediaQuery.size.width;

  /// Screen height in logical pixels
  static double get height => _mediaQuery.size.height;

  /// Screen width in physical pixels
  static int get widthPixels => (width * scale).toInt();

  /// Screen height in physical pixels
  static int get heightPixels => (height * scale).toInt();

  /// Screen size
  static Size get size => _mediaQuery.size;

  /// Screen orientation
  static Orientation get orientation => _mediaQuery.orientation;

  /// Is device in portrait mode
  static bool get isPortrait => orientation == Orientation.portrait;

  /// Is device in landscape mode
  static bool get isLandscape => orientation == Orientation.landscape;

  // MARK: - Safe Area Properties
  /// Top safe area height (status bar, notch)
  static double get topSafeHeight => _mediaQuery.padding.top;

  /// Bottom safe area height (navigation bar, home indicator)
  static double get bottomSafeHeight => _mediaQuery.padding.bottom;

  /// Left safe area width
  static double get leftSafeWidth => _mediaQuery.padding.left;

  /// Right safe area width
  static double get rightSafeWidth => _mediaQuery.padding.right;

  /// Safe area insets
  static EdgeInsets get safeAreaInsets => _mediaQuery.padding;

  /// Available height excluding safe areas
  static double get safeHeight => height - topSafeHeight - bottomSafeHeight;

  /// Available width excluding safe areas
  static double get safeWidth => width - leftSafeWidth - rightSafeWidth;

  // MARK: - Device Type Detection
  /// Check if device is considered a phone (width < 600dp)
  static bool get isPhone => width < 600;

  /// Check if device is considered a tablet (width >= 600dp)
  static bool get isTablet => width >= 600;

  /// Check if device is considered a desktop (width >= 1200dp)
  static bool get isDesktop => width >= 1200;

  /// Check if device has a small screen (width < 360dp)
  static bool get isSmallScreen => width < 360;

  /// Check if device has a large screen (width >= 428dp)
  static bool get isLargeScreen => width >= 428;

  // MARK: - Responsive Breakpoints
  /// Extra small breakpoint (< 600dp)
  static bool get isXS => width < 600;

  /// Small breakpoint (600dp - 905dp)
  static bool get isSM => width >= 600 && width < 905;

  /// Medium breakpoint (905dp - 1240dp)
  static bool get isMD => width >= 905 && width < 1240;

  /// Large breakpoint (1240dp - 1440dp)
  static bool get isLG => width >= 1240 && width < 1440;

  /// Extra large breakpoint (>= 1440dp)
  static bool get isXL => width >= 1440;

  // MARK: - Responsive Values
  /// Get responsive value based on screen size
  static T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }

  /// Get value based on breakpoints
  static T breakpoint<T>({
    required T xs,
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    if (isXL && xl != null) return xl;
    if (isLG && lg != null) return lg;
    if (isMD && md != null) return md;
    if (isSM && sm != null) return sm;
    return xs;
  }

  // MARK: - Spacing and Sizing Helpers
  /// Get responsive padding based on screen size
  static EdgeInsets get responsivePadding => EdgeInsets.all(
        responsive(
          mobile: 16.0,
          tablet: 24.0,
          desktop: 32.0,
        ),
      );

  /// Get responsive horizontal padding
  static EdgeInsets get responsiveHorizontalPadding => EdgeInsets.symmetric(
        horizontal: responsive(
          mobile: 16.0,
          tablet: 24.0,
          desktop: 32.0,
        ),
      );

  /// Get responsive vertical padding
  static EdgeInsets get responsiveVerticalPadding => EdgeInsets.symmetric(
        vertical: responsive(
          mobile: 16.0,
          tablet: 20.0,
          desktop: 24.0,
        ),
      );

  /// Get responsive content width (with max width constraints)
  static double get contentWidth => responsive(
        mobile: width,
        tablet: width * 0.8,
        desktop: 1200.0,
      ).clamp(0.0, width);

  // MARK: - System UI Control
  /// Update status bar style
  static void setStatusBarStyle(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  /// Set light status bar (dark icons)
  static void setLightStatusBar() {
    setStatusBarStyle(SystemUiOverlayStyle.dark);
  }

  /// Set dark status bar (light icons)
  static void setDarkStatusBar() {
    setStatusBarStyle(SystemUiOverlayStyle.light);
  }

  /// Hide status bar
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  /// Show status bar
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  /// Set preferred orientations
  static void setPreferredOrientations(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  /// Lock to portrait orientation
  static void lockPortrait() {
    setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// Lock to landscape orientation
  static void lockLandscape() {
    setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  /// Allow all orientations
  static void allowAllOrientations() {
    setPreferredOrientations(DeviceOrientation.values);
  }

  // MARK: - Utility Methods
  /// Convert percentage of width to pixels
  static double widthPercent(double percentage) {
    return width * (percentage / 100);
  }

  /// Convert percentage of height to pixels
  static double heightPercent(double percentage) {
    return height * (percentage / 100);
  }

  /// Convert percentage of safe height to pixels
  static double safeHeightPercent(double percentage) {
    return safeHeight * (percentage / 100);
  }

  /// Get aspect ratio of the screen
  static double get aspectRatio => width / height;

  /// Check if screen has notch (top safe area > 24)
  static bool get hasNotch => topSafeHeight > 24;

  /// Check if device supports keyboard
  static bool get hasKeyboard => _mediaQuery.viewInsets.bottom > 0;

  /// Get keyboard height
  static double get keyboardHeight => _mediaQuery.viewInsets.bottom;
}
