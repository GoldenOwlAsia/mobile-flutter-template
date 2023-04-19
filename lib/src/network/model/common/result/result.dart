import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class MResult<T> with _$MResult<T> {
  const MResult._();
  const factory MResult.data(T data) = _Data<T>;
  const factory MResult.error([Object? e]) = _Error<T>;

  String? get errorMessage {
    return whenOrNull(
      error: (e) {
        String? result;
        if (e is PlatformException) {
          result = e.message;
        } else if (e is AssertionError) {
          result = e.message.toString();
        } else if (e is FirebaseException) {
          result = e.message?.toString();
        } else if (e is Exception) {
          result = e.toString();
        }
        return result ?? 'An Unknown Error Occurred';
      },
    );
  }
}
