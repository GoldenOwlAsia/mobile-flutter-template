import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/config/devices/app_info.dart';
import 'package:myapp/src/core/services/firebase_message.dart';
import 'package:myapp/src/core/services/remote_config/remote_config_service.dart';
import 'package:myapp/src/locator.config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/common/app_bloc/bloc_observer.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future _configureDependencies() => getIt.init();

@module
abstract class InjectionModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

Future initializeApp({String? name, FirebaseOptions? firebaseOptions}) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await _configureDependencies();
  await Firebase.initializeApp(name: name, options: firebaseOptions);
  await Future.wait([
    AppInfo.initialize(),
    dotenv.load(fileName: ".env"),
    XFirebaseMessage.instance.initialize(),
  ]);
  await RemoteConfigService.getRemoteConfig();

  Bloc.observer = XBlocObserver();
  // Bloc.transformer = XEventTransformer(),
}
