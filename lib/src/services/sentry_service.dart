import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/src/config/env/env.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

class SentryService {
  static Future<void> setupSentry({required AppRunner appRunner}) async {
    await SentryFlutter.init(
      (options) {
        options.dsn = ENV.I.sentryDNS;
        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0;
        options.reportPackages = false;
        options.addInAppInclude('sentry_flutter_example');
        options.considerInAppFramesByDefault = false;
        options.attachThreads = true;
        options.enableWindowMetricBreadcrumbs = true;
        options.addIntegration(LoggingIntegration());
        options.sendDefaultPii = true;
        options.reportSilentFlutterErrors = true;
        options.attachScreenshot = true;
        options.attachViewHierarchy = true;
        // We can enable Sentry debug logging during development. This is likely
        // going to log too much for your app, but can be useful when figuring out
        // configuration issues, e.g. finding out why your events are not uploaded.
        options.diagnosticLevel = SentryLevel.debug;
        options.debug = kDebugMode;
        options.spotlight = Spotlight(enabled: true);
        options.enableTimeToFullDisplayTracing = true;

        options.maxRequestBodySize = MaxRequestBodySize.always;
        options.navigatorKey = AppCoordinator.navigatorKey;

        options.replay.sessionSampleRate = 0.0;
        options.replay.onErrorSampleRate = 1.0;

        options.enableLogs = true;

        options.dist = '1';
        options.environment = ENV.isDev ? 'development' : 'production';
        options.beforeSend = beforeSend;
      },
      // Init your App.
      appRunner: appRunner,
    );
  }

  static const ignoreErrors = [
    'No host specified in URI', //! Failed to load network image
    'OSStatus error -12939', //! unknown video error
    'VideoError',
    'Gyroscope sensor',
    'was used after being disposed',
    //! Ignore issues on android come from just-audio - does not affect app function, cannot be fixed - wait for package upgrade
    'Could not connect to the server',
    'just_audio',
  ];

  static SentryEvent? beforeSend(SentryEvent event, hint) {
    final exception = event.throwable;
    if (exception is Exception) {
      final exceptionString = exception.toString();
      if (ignoreErrors.any((e) => exceptionString.contains(e))) {
        return null;
      }
    }

    if (exception is FlutterError) {
      final exceptionString = exception.message;
      if (ignoreErrors.any((e) => exceptionString.contains(e))) {
        return null;
      }
    }

    // Log API error
    if (event.throwable is DioException) {
      final exceptionValueParam = 'value';
      final dioException = event.throwable as DioException;
      final lastExceptions = event.exceptions?.lastOrNull;
      final lastExceptionsJson = lastExceptions?.toJson() ?? {};
      lastExceptionsJson[exceptionValueParam] =
          lastExceptionsJson[exceptionValueParam] +
          '' +
          'URL = ${dioException.requestOptions.path}';
      event.exceptions?.removeLast();
      event.exceptions?.add(SentryException.fromJson(lastExceptionsJson));
      return event;
    }
    return event;
  }

  static void captureException(dynamic exception, dynamic stackTrace) {
    Sentry.captureException(exception, stackTrace: stackTrace);
  }

  static void configureScope({required String id, required String email}) {
    Sentry.configureScope((scope) {
      scope.setUser(SentryUser(id: id, email: email));
    });
  }

  static void addNavigationBreadcrumb({required String screenName}) {
    Sentry.addBreadcrumb(
      Breadcrumb(
        category: 'navigation',
        message: 'User navigated to $screenName',
        level: SentryLevel.info,
      ),
    );
  }

  static void addBreadcrumb({
    required String category,
    required String message,
  }) {
    Sentry.addBreadcrumb(
      Breadcrumb(category: category, message: message, level: SentryLevel.info),
    );
  }
}
