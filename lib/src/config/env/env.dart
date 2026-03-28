class ENV {
  static final ENV _instance = ENV._internal();
  ENV._internal();

  factory ENV() => _instance;

  static ENV get instance => _instance;
  static ENV get I => instance;

  static const bool isDev = true;

  /// Sentry DSN for error tracking
  String get sentryDNS => const String.fromEnvironment('SENTRY_DNS');

  /// Base API URL
  String get baseApiUrl => const String.fromEnvironment('BASE_API_URL');

  /// Check if Sentry is configured
  bool get isSentryEnabled => sentryDNS.isNotEmpty;
}
