import 'dart:io';

import 'package:dio/dio.dart';

// NOTE: You can customize it according to your project's status code
enum MErrorCode {
  net(1000, 'Network error'),
  parse(1001, 'Parse error'),
  socket(1002, 'Socket error'),
  http(1003, 'Http error'),
  connectTimeout(1004, 'Connect timeout error'),
  sendTimeout(1005, 'Send timeout error'),
  receiveTimeout(1006, 'Receive timeout error'),
  cancel(1007, 'Cancel error'),
  unknown(9999, 'Unknown');

  const MErrorCode(this.code, this.message);

  final String message;
  final int code;

  static String toMessage(int code) {
    return MErrorCode.values.firstWhere((e) => e.code == code).message;
  }

  static MErrorCode getWithCode(int code) {
    return MErrorCode.values.firstWhere((e) => e.code == code);
  }

  static MErrorCode handleException(dynamic error) {
    if (error is DioError) {
      if (error.type.errorCode == 0) {
        return _handleException(error.error);
      } else {
        return MErrorCode.getWithCode(error.type.errorCode);
      }
    } else {
      return _handleException(error);
    }
  }

  static MErrorCode _handleException(dynamic error) {
    MErrorCode errorCode = unknown;
    if (error is SocketException) {
      errorCode = socket;
    }
    if (error is HttpException) {
      errorCode = http;
    }
    if (error is FormatException) {
      errorCode = parse;
    }
    return errorCode;
  }
}

extension DioErrorTypeExtension on DioErrorType {
  int get errorCode => [
        MErrorCode.connectTimeout.code,
        MErrorCode.sendTimeout.code,
        MErrorCode.receiveTimeout.code,
        0, // Bad Certificate
        0, // Bad Response
        MErrorCode.cancel.code,
        0, // Connection Error
        MErrorCode.unknown.code,
      ][index];
}
