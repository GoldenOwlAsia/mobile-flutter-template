import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:myapp/src/config/env/env.dart';
import 'package:myapp/src/services/user_prefs.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// HTTP methods supported by the XHttp client
enum XMethod { get, post, put, patch, delete, head }

/// A singleton HTTP client wrapper around Dio for making API requests.
/// Provides centralized configuration, authentication, and error handling.
///
/// Usage:
/// ```dart
/// final response = await XHttp.I.get('/users');
/// ```
class XHttp {
  factory XHttp() => instance;
  XHttp._internal();

  static final XHttp instance = XHttp._internal();
  static XHttp get I => instance;

  /// Current authentication token for API requests
  String? tokenApi;

  /// Logger instance for debugging network requests and responses
  final Logger _log = Logger(
    printer: PrettyPrinter(
      methodCount: 0, // Number of method calls to be displayed
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );

  /// Base URL for all API requests
  String baseUrl = ENV.I.baseApiUrl;

  /// Default timeout duration in seconds for API requests
  final int _defaultSecondTimeout = 15;

  /// Default headers for all HTTP requests
  Map<String, String> get _headers => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  /// Configures and returns a Dio instance with custom settings
  ///
  /// [ignoreToken] - If true, skips adding authorization header
  /// [timeout] - Custom timeout in seconds, defaults to [_defaultSecondTimeout]
  /// [token] - Override token to use instead of [tokenApi]
  Dio _configDio({bool ignoreToken = false, int? timeout, String? token}) {
    final durationTimeout = Duration(seconds: timeout ?? _defaultSecondTimeout);
    final String? tokenValue = ignoreToken ? null : token ?? tokenApi;
    final headers = {
      ..._headers,
      if (tokenValue?.isNotEmpty == true) "Authorization": "Bearer $tokenValue",
    };
    final option = BaseOptions(
      responseType: ResponseType.json,
      validateStatus: (status) {
        // Accept all status codes, let the caller handle errors
        return true;
      },
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: durationTimeout,
      receiveTimeout: durationTimeout,
      sendTimeout: durationTimeout,
    );
    return Dio(option);
  }

  /// Clears the authentication token from memory and storage
  void removeTokenApi() {
    UserPrefs.I.setToken(null);
    tokenApi = '';
  }

  /// Sets the authentication token for API requests
  /// The token is persisted in user preferences for session management
  ///
  /// [token] - The authentication token to set
  void setTokenApi(String token) {
    UserPrefs.I.setToken(token);
    _log.d('Authentication token updated');
    tokenApi = token;
  }

  /// Makes an HTTP request with the specified method and parameters
  ///
  /// [method] - The HTTP method to use (GET, POST, PUT, etc.)
  /// [url] - The endpoint URL (relative to baseUrl)
  /// [data] - Request body data
  /// [queryParameters] - URL query parameters
  /// [onSendProgress] - Callback for upload progress
  /// [onReceiveProgress] - Callback for download progress
  /// [cancelToken] - Token to cancel the request
  /// [options] - Additional Dio options
  /// [ignoreToken] - If true, don't include authentication token
  /// [timeout] - Custom timeout in seconds
  /// [token] - Override the default authentication token
  ///
  /// Returns the [Response] from the server
  /// Throws [DioException] on network or server errors
  Future<Response> request(
    XMethod method,
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    Options? options,
    bool ignoreToken = false,
    int? timeout,
    String? token,
  }) async {
    Object? bodyResponse;

    // Add breadcrumb for API request
    Sentry.addBreadcrumb(
      Breadcrumb(
        type: 'http',
        category: 'http.request',
        data: {
          'url': url,
          'method': method.name,
          'query_params': queryParameters?.toString(),
          'has_data': data != null,
        },
        level: SentryLevel.info,
      ),
    );

    try {
      final Response response =
          await _configDio(
            ignoreToken: ignoreToken,
            timeout: timeout,
            token: token,
          ).request(
            url,
            data: data,
            queryParameters: queryParameters,
            options: _checkOptions(method.name, options),
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
            cancelToken: cancelToken,
          );
      bodyResponse = response.data;
      _log.i('> RESPONSE Status< [${response.statusCode}]<  $url');
      _log.i('> RESPONSE Body< ${response.data.toString()}');

      // Add breadcrumb for successful response
      Sentry.addBreadcrumb(
        Breadcrumb(
          type: 'http',
          category: 'http.response',
          data: {
            'url': url,
            'method': method.name,
            'status_code': response.statusCode,
          },
          level: SentryLevel.info,
        ),
      );

      return response;
    } on DioException catch (e, stackTrace) {
      // Log network-specific errors (timeouts, connection failures, etc.)
      _log.e('> DIO ERROR< $e');
      _log.e('> RESPONSE Body< $bodyResponse');

      // Add breadcrumb for error response
      Sentry.addBreadcrumb(
        Breadcrumb(
          type: 'http',
          category: 'http.error',
          data: {
            'url': url,
            'method': method.name,
            'status_code': e.response?.statusCode,
            'error_type': e.type.toString(),
          },
          level: SentryLevel.error,
        ),
      );

      // Log to Sentry as debug level for monitoring
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        hint: Hint.withMap({
          'url': url,
          'method': method.name,
          'statusCode': e.response?.statusCode,
          'responseData': bodyResponse,
        }),
        withScope: (scope) {
          scope.level = SentryLevel.debug;
        },
      );
      rethrow;
    } catch (e, stackTrace) {
      // Log any other unexpected errors
      _log.e('> UNEXPECTED ERROR< $e');
      _log.e('> RESPONSE Body< $bodyResponse');

      // Add breadcrumb for unexpected error
      Sentry.addBreadcrumb(
        Breadcrumb(
          type: 'error',
          category: 'http.exception',
          data: {'url': url, 'method': method.name, 'error': e.toString()},
          level: SentryLevel.error,
        ),
      );

      // Log to Sentry as debug level for monitoring
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        hint: Hint.withMap({
          'url': url,
          'method': method.name,
          'responseData': bodyResponse,
        }),
        withScope: (scope) {
          scope.level = SentryLevel.debug;
        },
      );
      rethrow;
    }
  }

  /// Ensures Options object exists and sets the HTTP method
  Options _checkOptions(String? method, Options? options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  // ============================================================================
  // Convenience methods for common HTTP operations
  // Customize these according to your project's needs
  // ============================================================================
  // ============================================================================
  // Convenience methods for common HTTP operations
  // Customize these according to your project's needs
  // ============================================================================

  /// Performs a GET request to fetch data from the server
  ///
  /// [url] - The endpoint URL (relative to baseUrl)
  /// [queryParameters] - URL query parameters
  /// [ignoreToken] - If true, don't include authentication token
  /// [timeout] - Custom timeout in seconds
  /// [token] - Override the default authentication token
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    bool ignoreToken = false,
    int? timeout,
    String? token,
  }) {
    return request(
      XMethod.get,
      url,
      queryParameters: queryParameters,
      ignoreToken: ignoreToken,
      timeout: timeout,
      token: token,
    );
  }

  /// Performs a POST request to create new resources on the server
  ///
  /// [url] - The endpoint URL (relative to baseUrl)
  /// [data] - Request body data
  /// [ignoreToken] - If true, don't include authentication token
  /// [timeout] - Custom timeout in seconds
  /// [token] - Override the default authentication token
  Future<Response> post(
    String url, {
    Object? data,
    bool ignoreToken = false,
    int? timeout,
    String? token,
  }) {
    return request(
      XMethod.post,
      url,
      data: data,
      ignoreToken: ignoreToken,
      timeout: timeout,
      token: token,
    );
  }

  /// Performs a PUT request to update existing resources on the server
  ///
  /// [url] - The endpoint URL (relative to baseUrl)
  /// [data] - Request body data with full resource representation
  /// [ignoreToken] - If true, don't include authentication token
  /// [timeout] - Custom timeout in seconds
  /// [token] - Override the default authentication token
  Future<Response> put(
    String url, {
    Object? data,
    bool ignoreToken = false,
    int? timeout,
    String? token,
  }) {
    return request(
      XMethod.put,
      url,
      data: data,
      ignoreToken: ignoreToken,
      timeout: timeout,
      token: token,
    );
  }

  /// Performs a PATCH request to partially update resources on the server
  ///
  /// [url] - The endpoint URL (relative to baseUrl)
  /// [data] - Request body data with partial resource updates
  /// [ignoreToken] - If true, don't include authentication token
  /// [timeout] - Custom timeout in seconds
  /// [token] - Override the default authentication token
  Future<Response> patch(
    String url, {
    Object? data,
    bool ignoreToken = false,
    int? timeout,
    String? token,
  }) {
    return request(
      XMethod.patch,
      url,
      data: data,
      ignoreToken: ignoreToken,
      timeout: timeout,
      token: token,
    );
  }

  /// Performs a DELETE request to remove resources from the server
  ///
  /// [url] - The endpoint URL (relative to baseUrl)
  /// [ignoreToken] - If true, don't include authentication token
  /// [timeout] - Custom timeout in seconds
  /// [token] - Override the default authentication token
  Future<Response> delete(
    String url, {
    bool ignoreToken = false,
    int? timeout,
    String? token,
  }) {
    return request(
      XMethod.delete,
      url,
      ignoreToken: ignoreToken,
      timeout: timeout,
      token: token,
    );
  }

  /// Checks if the device has no network connectivity
  ///
  /// Returns `true` if there is NO network connection (offline)
  /// Returns `false` if there is an active network connection (online)
  ///
  /// Useful for checking connectivity before making API requests
  Future<bool> hasNoConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.none);
  }
}
