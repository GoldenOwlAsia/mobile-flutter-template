import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/features/settings/logic/setting_bloc.dart';
import 'package:myapp/src/services/user_defaults.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final userDefaults = UserDefaults();
    await userDefaults.initialize();

    final getIt = GetIt.instance;
    if (!getIt.isRegistered<UserDefaults>()) {
      getIt.registerLazySingleton<UserDefaults>(() => userDefaults);
    }
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  group('SettingBloc', () {
    test('initial state uses system theme', () {
      final bloc = SettingBloc();
      expect(bloc.state.themeMode, ThemeMode.system);
      bloc.close();
    });

    blocTest<SettingBloc, SettingState>(
      'emits light mode when onChangeTheme is called with light',
      build: SettingBloc.new,
      act: (bloc) => bloc.onChangeTheme(ThemeMode.light),
      expect: () => [const SettingState(themeMode: ThemeMode.light)],
    );

    blocTest<SettingBloc, SettingState>(
      'emits dark mode when onChangeTheme is called with dark',
      build: SettingBloc.new,
      act: (bloc) => bloc.onChangeTheme(ThemeMode.dark),
      expect: () => [const SettingState(themeMode: ThemeMode.dark)],
    );

    blocTest<SettingBloc, SettingState>(
      'does nothing when onChangeTheme is called with null',
      build: SettingBloc.new,
      act: (bloc) => bloc.onChangeTheme(null),
      expect: () => <SettingState>[],
    );

    blocTest<SettingBloc, SettingState>(
      'persists theme to UserDefaults',
      build: SettingBloc.new,
      act: (bloc) => bloc.onChangeTheme(ThemeMode.dark),
      verify: (_) {
        expect(GetIt.I<UserDefaults>().getTheme(), ThemeMode.dark);
      },
    );
  });
}
