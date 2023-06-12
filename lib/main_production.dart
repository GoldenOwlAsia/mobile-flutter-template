import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/locator.dart';

import 'firebase_options/firebase_options_prod.dart';
import 'src/app.dart';

Future main() async {
  await initializeApp(
      name: "production",
      firebaseOptions: DefaultFirebaseOptions.currentPlatform);
  if (kIsWeb) {
    runApp(const MyApp());
  } else {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    runZonedGuarded<Future<void>>(() async {
      runApp(const MyApp());
    }, FirebaseCrashlytics.instance.recordError);
  }
}
