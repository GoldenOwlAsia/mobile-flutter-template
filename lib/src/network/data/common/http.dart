import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:myapp/src/config/env/env.dart';
import 'package:myapp/src/services/user_defaults.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

enum XMethod { get, post, put, patch, delete, head }

class XHttp {
  XHttp() {
    _dio = _createDio();
  }

  String? tokenApi;

  late final Dio _dio;

  final Logger _log = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );

  String baseUrl = ENV.baseApiUrl;

  static const int _defaultSecondTimeout = 15;

  Dio _createDio() {
    final durationTimeout = const Duration(seconds: _defaultSecondTimeout);
    return Dio(
      BaseOptions(
        responseType: ResponseType.json,
        validateStatus: (status) => status != null && status < 500,
        baseUrl: baseUrl,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        connectTimeout: durationTimeout,
        receiveTimeout: durationTimeout,
        sendTimeout: durationTimeout,
      ),
    );
  }

  Options _buildOptions(
    String method, {
    bool ignoreToken = false,
    String? token,
    int? timeout,
    Options? extra,
  }) {
    final options = extra ?? Options();
    options.method = method;

    final String? tokenValue = ignoreToken ? null : token ?? tokenApi;
    if (tokenValue != null && tokenValue.isNotEmpty) {
      options.headers = {
        ...?options.headers,
        'Authorization': 'Bearer $tokenValue',
      };
    }

    if (timeout != null) {
      final customDuration = Duration(seconds: timeout);
      options.sendTimeout = customDuration;
      options.receiveTimeout = customDuration;
    }

    return options;
  }

  void removeTokenApi() {
    GetIt.I<UserDefaults>().setToken(null);
    tokenApi = '';
  }

  void setTokenApi(String token) {
    GetIt.I<UserDefaults>().setToken(token);
    tokenApi = token;
  }

  Future<Response<dynamic>> request(
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
      final Response<dynamic> response = await _dio.request<dynamic>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: _buildOptions(
          method.name,
          ignoreToken: ignoreToken,
          token: token,
          timeout: timeout,
          extra: options,
        ),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );
      bodyResponse = response.data;
      _log.i('> RESPONSE Status< [${response.statusCode}]<  $url');
      _log.i('> RESPONSE Body< ${response.data}');

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
      _log.e('> DIO ERROR< $e');
      _log.e('> RESPONSE Body< $bodyResponse');

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
    } on Object catch (e, stackTrace) {
      _log.e('> UNEXPECTED ERROR< $e');
      _log.e('> RESPONSE Body< $bodyResponse');

      Sentry.addBreadcrumb(
        Breadcrumb(
          type: 'error',
          category: 'http.exception',
          data: {'url': url, 'method': method.name, 'error': e.toString()},
          level: SentryLevel.error,
        ),
      );

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

  Future<Response<dynamic>> get(
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

  Future<Response<dynamic>> post(
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

  Future<Response<dynamic>> put(
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

  Future<Response<dynamic>> patch(
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

  Future<Response<dynamic>> delete(
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

  Future<bool> hasNoConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.none);
  }
}
