import 'dart:core';
import 'result.dart';

class MHandle<T> {
  String? message;

  T? _data;

  T? get data => _data;

  Status _status = Status.none;

  bool get isLoading => _status == Status.loading;

  bool get isCompleted => _status == Status.success;

  bool get isError => _status == Status.error;

  MHandle() {
    _status = Status.none;
  }
  MHandle.loading({this.message}) {
    _status = Status.loading;
  }

  MHandle.completed(T data) {
    this._data = data;
    this.message = '';
    _status = Status.success;
  }

  MHandle.error(this.message) {
    _data = null;
    _status = Status.error;
  }

  MHandle.result(MResult<T> result) {
    this.message = result.error;
    _data = result.data;
    _status = result.isError ? Status.error : Status.success;
  }
}

enum Status { none, loading, error, success }
