import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:myapp/src/localization/localization_utils.dart';

import 'exception_handle.dart';

enum XMethod { get, post, put, patch, delete, head }

typedef XNetErrorCallback = Function(int code, String msg);

class XHttp {
  factory XHttp() => instance;
  XHttp._internal() {
    final BaseOptions options = BaseOptions(
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: _baseUrl,
      headers: _headers,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
    );

    _dio = Dio(options);
  }

  static final XHttp instance = XHttp._internal();
  static XHttp get I => instance;
  static late Dio _dio;

  static String? tokenType;
  static String? tokenApi;
  static final Logger _log = Logger();

  static String _baseUrl = '';
  static Duration _connectTimeout = const Duration(seconds: 10);
  static Duration _receiveTimeout = const Duration(seconds: 10);
  static Duration _sendTimeout = const Duration(seconds: 5);

  static const _methodValues = {
    XMethod.get: 'get',
    XMethod.post: 'post',
    XMethod.delete: 'delete',
    XMethod.put: 'put',
    XMethod.patch: 'patch',
    XMethod.head: 'head',
  };

  static Map<String, String> get _headers => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "$tokenType $tokenApi"
      };

  /// Configure Dio
  static void configDio({
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    String? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    _connectTimeout = connectTimeout ?? _connectTimeout;
    _receiveTimeout = receiveTimeout ?? _receiveTimeout;
    _sendTimeout = sendTimeout ?? _sendTimeout;
    _baseUrl = baseUrl ?? _baseUrl;
  }

  static void setTokenApi(String tokenApi, {String tokenType = "Bearer"}) {
    XHttp.tokenType = tokenType;
    XHttp.tokenApi = tokenApi;
  }

  static Future<String> request(
    XMethod method,
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    XNetErrorCallback? onError,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    String bodyResponse = '';
    try {
      // Check internet
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        _log.e('> NO INTERNET <');
        _onError(XExceptionHandle.net_error, S.text.error_noInternet, onError);
      }
      final Response response = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: _checkOptions(_methodValues[method], options),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );
      bodyResponse = response.data;
      _log.i('> RESPONSE [${response.statusCode}]<  $url');
      return bodyResponse;
    } on DioError catch (e) {
      _log.e('> API CATCH Error< $e');
      final XNetError error = XExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
      rethrow;
    }
  }

  static Options _checkOptions(String? method, Options? options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  static void _onError(int? code, String msg, XNetErrorCallback? onError) {
    if (code == null) {
      code = XExceptionHandle.unknown_error;
      msg = S.text.error_unknown;
    }
    _log.e('API CATCH status：code: $code, mag: $msg');
    onError?.call(code, msg);
  }

  static Future<String> get(String url) {
    return request(XMethod.get, url);
  }

  static Future<String> post(String url,
      {Object? data, Map<String, dynamic>? queryParameters}) {
    return request(XMethod.post, url,
        data: data, queryParameters: queryParameters);
  }
}
