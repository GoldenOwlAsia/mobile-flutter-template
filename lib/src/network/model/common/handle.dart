import 'dart:core';

import 'package:myapp/src/network/model/common/result.dart';

part 'status.dart';

class MHandle<T> {
  final String? message;
  final T? data;
  final MStatus status;

  const MHandle._({
    this.message,
    this.data,
    this.status = MStatus.initial,
  });

  const MHandle() : this._();

  factory MHandle.result(MResult<T> result) => MHandle._(
        message: result.error,
        data: result.data,
        status: result.isError ? MStatus.failure : MStatus.success,
      );

  factory MHandle.error(String? message) => MHandle._(
        message: message,
        status: MStatus.failure,
      );

  factory MHandle.completed(T data) => MHandle._(
        data: data,
        message: '',
        status: MStatus.success,
      );

  factory MHandle.loading({String? message}) => MHandle._(
        message: message,
        status: MStatus.loading,
      );

  bool get isLoading => status == MStatus.loading;
  bool get isCompleted => status == MStatus.success;
  bool get isError => status == MStatus.failure;
}
