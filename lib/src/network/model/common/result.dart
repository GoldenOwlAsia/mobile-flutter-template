import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/src/network/model/common/error_code.dart';

class MResult<T> {
  final T? data;
  final String? error;

  const MResult._({this.data, this.error});

  factory MResult.success(T? data) => MResult._(data: data);

  factory MResult.error(String? error) => MResult._(error: error ?? '');

  factory MResult.exception(Object? e) {
    String? errorMsg;
    if (e is PlatformException) {
      errorMsg = e.message;
    } else if (e is AssertionError) {
      errorMsg = e.message?.toString();
    } else if (e is FlutterError) {
      errorMsg = e.message;
    }
    return MResult._(error: errorMsg ?? MErrorCode.unknown);
  }

  bool get isError => error != null;
  bool get isSuccess => !isError;
}
