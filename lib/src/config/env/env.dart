import 'package:flutter_dotenv/flutter_dotenv.dart';

class ENV {
  static const bool isDev = true;

  /// Sentry DSN for error tracking
  static String get sentryDsn => dotenv.env['SENTRY_DSN'] ?? '';

  /// Base API URL
  static String get baseApiUrl => dotenv.env['BASE_API_URL'] ?? '';

  /// Check if Sentry is configured
  static bool get isSentryEnabled => sentryDsn.isNotEmpty;
}
