import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/core/localization/localization_utils.dart';
import 'package:myapp/src/core/router/router.dart';
import 'package:myapp/src/core/theme/screen.dart';
import 'package:myapp/src/core/theme/themes.dart';
import 'package:myapp/src/features/account/cubit/account_cubit.dart';
import 'package:myapp/src/features/settings/logic/setting_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = GetIt.I<AppRouter>();
  @override
  Widget build(BuildContext context) {
    AppScreens.mediaQuery = MediaQuery.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingBloc()),
        BlocProvider(create: (_) => GetIt.I<AccountCubit>()),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          onGenerateTitle: (BuildContext context) =>
              S.of(context).common_appTitle,
          builder: BotToastInit(),
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: state.themeMode,
          routerConfig: _appRouter.router,
        );
      }),
    );
  }
}
