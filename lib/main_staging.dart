import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/firebase_options/firebase_options_stg.dart';
import 'package:myapp/src/app.dart';
import 'package:myapp/src/locator.dart';
import 'package:myapp/src/services/sentry_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future main() async {
  await initializeApp(
    name: "staging",
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );

  await SentryService.setupSentry(
    appRunner: () {
      runApp(
        SentryWidget(
          child: DefaultAssetBundle(
            bundle: SentryAssetBundle(),
            child: const MyApp(),
          ),
        ),
      );
    },
  );
}
