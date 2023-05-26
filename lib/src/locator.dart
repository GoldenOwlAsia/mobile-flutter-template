import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/config/devices/app_Info.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/router/router.dart';
import 'package:myapp/src/services/user_prefs.dart';

import '../firebase_options.dart';
import 'features/common/app_bloc/bloc_observer.dart';
import 'services/firebase_message.dart';

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  _locator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Future.wait([
    AppInfo.initialize(),
    UserPrefs.instance.initialize(),
    XFirebaseMessage.instance.initialize()
  ]);

  Bloc.observer = XBlocObserver();
  // Bloc.transformer = XEventTransformer(),
}

void _locator() {
  GetIt.I.registerLazySingleton(() => DomainManager());
  GetIt.I.registerLazySingleton(() => XRouter());
  GetIt.I.registerLazySingleton(() => AccountBloc());
}
