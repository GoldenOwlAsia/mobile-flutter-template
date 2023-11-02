import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../localization/localization_utils.dart';

enum XMethod {
  get,
  post,
  put,
  patch,
  delete,
  head;
}

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
  late Dio _dio;

  String? tokenType;
  String? tokenApi;
  final Logger _log = Logger();

  String _baseUrl = '';
  Duration _connectTimeout = const Duration(seconds: 10);
  Duration _receiveTimeout = const Duration(seconds: 10);
  Duration _sendTimeout = const Duration(seconds: 5);

  Map<String, String> get _headers => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "$tokenType $tokenApi"
      };

  /// Configure Dio
  void configDio({
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

    _dio = Dio(_dio.options.copyWith(
      baseUrl: _baseUrl,
      headers: _headers,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
    ));
  }

  void setTokenApi(String tokenApi, {String tokenType = "Bearer"}) {
    this.tokenType = tokenType;
    this.tokenApi = tokenApi;
    configDio();
  }

  Future<String> request(
    XMethod method,
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    String bodyResponse = '';
    try {
      final Response response = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: _checkOptions(method.name, options),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );
      bodyResponse = response.data;
      _log.i('> RESPONSE [${response.statusCode}]<  $url');

      if (response.statusCode == null) {
        throw FlutterError(S.text.error_unknown);
      }
      if (response.statusCode! <= 299) {
        return bodyResponse;
      } else {
        if (response.statusCode! >= 400) {
          throw FlutterError(S.text.error_noInternet);
        } else {
          throw FlutterError(S.text.error_unknown);
        }
      }
    } on DioException catch (e) {
      _log.w('> API CATCH Error< $e');
      _log.w('> API CATCH Body< $bodyResponse');
      rethrow;
    } catch (e) {
      _log.w('> API CATCH Error< $e');
      _log.w('> API CATCH Body< $bodyResponse');
      rethrow;
    }
  }

  Options _checkOptions(String? method, Options? options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  // NOTE: Example simple GET/POST, You can customize it according to your project's.
  Future<String> get(String url) {
    return request(XMethod.get, url);
  }

  Future<String> post(String url,
      {Object? data, Map<String, dynamic>? queryParameters}) {
    return request(XMethod.post, url,
        data: data, queryParameters: queryParameters);
  }

  Future<bool> checkConnectivity()async{
    final connectivityResult = await(Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;

  }
}
