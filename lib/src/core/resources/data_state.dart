import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/src/core/models/common/error_code.dart';

abstract class DataState<T> extends Equatable {
  final T? data;
  final String? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);

  @override
  List<Object?> get props => [data];
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(String error) : super(error: error);

  factory DataFailed.exception(Object? e) {
    if (e is PlatformException) {
      return DataFailed(e.message.toString());
    } else if (e is AssertionError) {
      return DataFailed(e.message.toString());
    } else if (e is FlutterError) {
      return DataFailed(e.message);
    }
    return const DataFailed(MErrorCode.unknown);
  }

  @override
  List<Object?> get props => [error];
}
