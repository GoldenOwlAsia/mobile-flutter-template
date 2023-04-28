import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/src/network/model/common/result/result.dart';

part 'handle.freezed.dart';

@freezed
class MHandle<T> with _$MHandle<T> {
  const MHandle._();
  const factory MHandle.initial() = _Initial;
  const factory MHandle.loading() = _Loading;
  const factory MHandle.complete(MResult<T> result) = _Complete<T>;

  bool get isInitial => this is _Initial;
  bool get isLoading => this is _Loading;
  bool get isComplete => this is _Complete;
}
