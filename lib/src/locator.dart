// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/src/config/env/env.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:myapp/generated/injectable/injection.dart';
import 'package:myapp/src/config/devices/app_info.dart';
import 'package:myapp/src/features/common/app_bloc/bloc_observer.dart';
import 'package:myapp/src/router/router.dart';
import 'package:myapp/src/services/firebase_message.dart';
import 'package:myapp/src/services/remote_config/remote_config_service.dart';
import 'package:myapp/src/services/sentry_service.dart';
import 'package:myapp/src/network/data/common/http.dart';
import 'package:myapp/src/services/user_defaults.dart';
import 'package:myapp/src/utils/logger.dart';

Future<void> initializeApp({
  required AppFlavor flavor,
  FirebaseOptions? firebaseOptions,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  ENV.flavor = flavor;
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  _locator();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (!kDebugMode) {
      SentryService.captureException(
        details.exception,
        details.stack ?? StackTrace.current,
      );
    }
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    xLog.e('Uncaught platform error', error: error, stackTrace: stack);
    if (!kDebugMode) {
      SentryService.captureException(error, stack);
    }
    return true;
  };

  final appDocDir = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(appDocDir.path),
  );

  await Firebase.initializeApp(name: flavor.name, options: firebaseOptions);
  await Future.wait([
    AppInfo.initialize(),
    getIt<UserDefaults>().initialize(),
    XFirebaseMessage.instance.initialize(),
  ]);
  await RemoteConfigService.getRemoteConfig();

  Bloc.observer = XBlocObserver();
}

void _locator() {
  configureDependencies();
  getIt.registerLazySingleton(AppRouter.new);
  getIt.registerLazySingleton(UserDefaults.new);
  getIt.registerLazySingleton(XHttp.new);
}
