import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/src/services/user_defaults.dart';

part 'setting_state.dart';

@lazySingleton
class SettingBloc extends Cubit<SettingState> {
  SettingBloc()
    : _userDefaults = GetIt.I<UserDefaults>(),
      super(SettingState(themeMode: GetIt.I<UserDefaults>().getTheme()));

  final UserDefaults _userDefaults;

  void onChangeTheme(ThemeMode? mode) {
    if (mode != null) {
      emit(state.copyWith(themeMode: mode));
      _userDefaults.setTheme(mode);
    }
  }
}
