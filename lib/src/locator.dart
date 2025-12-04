import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:myapp/generated/injectable/injection.dart';
import 'package:myapp/src/config/devices/app_info.dart';
import 'package:myapp/src/router/router.dart';
import 'package:myapp/src/services/remote_config/remote_config_service.dart';
import 'package:myapp/src/services/user_prefs.dart';

import 'features/common/app_bloc/bloc_observer.dart';
import 'services/firebase_message.dart';

Future initializeApp({String? name, FirebaseOptions? firebaseOptions}) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  _locator();

  // Initialize HydratedBlocStorage
  final appDocDir = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(appDocDir.path),
  );

  await Firebase.initializeApp(name: name, options: firebaseOptions);
  await Future.wait([
    AppInfo.initialize(),
    UserPrefs.instance.initialize(),
    XFirebaseMessage.instance.initialize(),
    dotenv.load(fileName: '.env.$name'),
  ]);
  await RemoteConfigService.getRemoteConfig();

  Bloc.observer = XBlocObserver();
  // Bloc.transformer = XEventTransformer(),
}

void _locator() {
  configureDependencies();
  getIt.registerLazySingleton(() => AppRouter());
}
