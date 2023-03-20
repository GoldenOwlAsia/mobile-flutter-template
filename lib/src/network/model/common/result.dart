import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class MResult<T> {
  T? data;
  String? error;

  bool get isError => error != null;
  bool get isSuccess => error == null && data != null;

  MResult.success(this.data) {
    this.error = null;
  }

  MResult.error(String? error) {
    this.data = null;
    this.error = error ?? 'An Unknown Error Occurred';
  }

  MResult.exception(Object? e) {
    this.data = null;
    if (e is PlatformException) {
      error = e.message;
    } else if (e is AssertionError) {
      error = e.message?.toString();
    } else if (e is FirebaseException) {
      error = e.message?.toString();
    } else if (e is Exception) {
      error = e.toString();
    }
    error ??= 'An Unknown Error Occurred';
  }
}
