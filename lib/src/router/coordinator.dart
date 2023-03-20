import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/router/auto_router.dart';
import 'package:myapp/src/router/auto_router.gr.dart';

class XCoordinator {
  static XRouter get rootRouter => GetIt.I<XRouter>();

  static BuildContext get context =>
      rootRouter.navigatorKey.currentState!.context;

  static Future<bool> pop<T extends Object?>([T? result]) async {
    return rootRouter.pop(result);
  }

  static Future showAuthentication() async {
    return rootRouter.push(SignRoute());
  }
}
