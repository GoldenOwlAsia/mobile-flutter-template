// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myapp/src/localization/localization_utils.dart';

// NOTE: You can customize it according to your project's status code
class XExceptionHandle {
  static const int success = 200;
  static const int success_not_content = 204;
  static const int not_modified = 304;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int not_found = 404;

  static const int net_error = 1000;
  static const int parse_error = 1001;
  static const int socket_error = 1002;
  static const int http_error = 1003;
  static const int connect_timeout_error = 1004;
  static const int send_timeout_error = 1005;
  static const int receive_timeout_error = 1006;
  static const int cancel_error = 1007;
  static const int unknown_error = 9999;

  static final Map<int, XNetError> _errorMap = <int, XNetError>{
    net_error: XNetError(net_error, 'Network error'),
    parse_error: XNetError(parse_error, 'Parse error'),
    socket_error: XNetError(socket_error, 'Socket error'),
    http_error: XNetError(http_error, 'http error'),
    connect_timeout_error:
        XNetError(connect_timeout_error, 'Connect timeout error'),
    send_timeout_error: XNetError(send_timeout_error, 'Send timeout error'),
    receive_timeout_error:
        XNetError(receive_timeout_error, 'Receive timeout error'),
    cancel_error: XNetError(cancel_error, 'Cancel error'),
    unknown_error: XNetError(unknown_error, S.text.error_unknown),
  };

  static XNetError handleException(dynamic error) {
    if (error is DioError) {
      if (error.type.errorCode == 0) {
        return _handleException(error.error);
      } else {
        return _errorMap[error.type.errorCode]!;
      }
    } else {
      return _handleException(error);
    }
  }

  static XNetError _handleException(dynamic error) {
    int errorCode = unknown_error;
    if (error is SocketException) {
      errorCode = socket_error;
    }
    if (error is HttpException) {
      errorCode = http_error;
    }
    if (error is FormatException) {
      errorCode = parse_error;
    }
    return _errorMap[errorCode]!;
  }
}

class XNetError {
  int code;
  String msg;

  XNetError(this.code, this.msg);
}

extension DioErrorTypeExtension on DioErrorType {
  int get errorCode => [
        XExceptionHandle.connect_timeout_error,
        XExceptionHandle.send_timeout_error,
        XExceptionHandle.receive_timeout_error,
        XExceptionHandle.cancel_error,
      ][index];
}
