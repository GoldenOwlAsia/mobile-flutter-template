import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/core/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Keys {
  static const String theme = 'app-theme';
  static const String user = 'user';
  static const String token = 'token';
}

class PrefsUtils {
  factory PrefsUtils() => instance;
  PrefsUtils._internal();

  static final PrefsUtils instance = PrefsUtils._internal();
  static PrefsUtils get I => instance;
  static final SharedPreferences _prefs = GetIt.I<SharedPreferences>();

  // theme
  ThemeMode getTheme() {
    final value = _prefs.getString(_Keys.theme);
    return ThemeMode.values.firstWhere(
      (e) => e.toString().toLowerCase() == '$value'.toLowerCase(),
      orElse: () => ThemeMode.system,
    );
  }

  void setTheme(ThemeMode value) {
    _prefs.setString(_Keys.theme, value.toString().toLowerCase());
  }

  String getToken() {
    try {
      return _prefs.getString(_Keys.token) ?? '';
    } catch (_) {}
    return '';
  }

  void setToken(String? value) {
    if (value == null) {
      _prefs.remove(_Keys.token);
    } else {
      _prefs.setString(_Keys.token, value);
    }
  }

  // user
  void setUser(UserModel? value) {
    if (value == null) {
      _prefs.remove(_Keys.user);
    } else {
      _prefs.setString(_Keys.user, jsonEncode(value.toJson()));
    }
  }

  UserModel? getUser() {
    final value = _prefs.getString(_Keys.user);
    try {
      if ((value ?? '').isEmpty) {
        return null;
      } else {
        final map = jsonDecode(value!);
        if (map['id'] == null) {
          return null;
        } else {
          return UserModel.fromJson(map);
        }
      }
    } catch (e) {
      xLog.e(e);
      return null;
    }
  }
}
