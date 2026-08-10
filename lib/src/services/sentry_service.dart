import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/src/config/env/env.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

class SentryService {
  static Future<void> setupSentry({required AppRunner appRunner}) async {
    await SentryFlutter.init((options) {
      options.dsn = ENV.sentryDNS;
      options.tracesSampleRate = ENV.flavor.isStaging ? 1.0 : 0.2;
      options.reportPackages = false;
      options.addInAppInclude('myapp');
      options.considerInAppFramesByDefault = false;
      options.attachThreads = true;
      options.enableWindowMetricBreadcrumbs = true;
      options.addIntegration(LoggingIntegration());
      options.sendDefaultPii = false;
      options.reportSilentFlutterErrors = true;
      options.attachScreenshot = ENV.flavor.isStaging;
      options.diagnosticLevel = ENV.flavor.isStaging
          ? SentryLevel.debug
          : SentryLevel.warning;
      options.debug = kDebugMode;
      options.spotlight = Spotlight(enabled: kDebugMode);
      options.enableTimeToFullDisplayTracing = true;

      options.maxRequestBodySize = ENV.flavor.isStaging
          ? MaxRequestBodySize.always
          : MaxRequestBodySize.small;
      options.navigatorKey = AppCoordinator.navigatorKey;

      options.replay.sessionSampleRate = 0.0;
      options.replay.onErrorSampleRate = 1.0;

      options.enableLogs = true;

      options.environment = ENV.flavor.name;
      options.beforeSend = beforeSend;
    }, appRunner: appRunner);
  }

  static const ignoreErrors = [
    'No host specified in URI',
    'OSStatus error -12939',
    'VideoError',
    'Gyroscope sensor',
    'was used after being disposed',
    'Could not connect to the server',
    'just_audio',
  ];

  static SentryEvent? beforeSend(SentryEvent event, Hint hint) {
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

    if (event.throwable is DioException) {
      final dioException = event.throwable! as DioException;
      final lastExceptions = event.exceptions?.lastOrNull;
      final lastExceptionsJson = lastExceptions?.toJson() ?? {};
      const exceptionValueParam = 'value';
      lastExceptionsJson[exceptionValueParam] =
          '${lastExceptionsJson[exceptionValueParam]}'
          ' URL = ${dioException.requestOptions.path}';
      event.exceptions?.removeLast();
      event.exceptions?.add(SentryException.fromJson(lastExceptionsJson));
      return event;
    }
    return event;
  }

  static void captureException(Object exception, StackTrace stackTrace) {
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
