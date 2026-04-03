enum AppFlavor {
  staging,
  production;

  bool get isStaging => this == AppFlavor.staging;
  bool get isProduction => this == AppFlavor.production;
}

class ENV {
  ENV._();

  /// Set once during app bootstrap from the entry point (main.dart / main_staging.dart).
  static AppFlavor flavor = AppFlavor.staging;

  /// Sentry DSN for error tracking
  static String get sentryDNS => const String.fromEnvironment('SENTRY_DNS');

  /// Base API URL
  static String get baseApiUrl => const String.fromEnvironment('BASE_API_URL');

  /// Check if Sentry is configured
  static bool get isSentryEnabled => sentryDNS.isNotEmpty;
}
