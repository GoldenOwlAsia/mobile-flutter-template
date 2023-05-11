import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/router/route_name.dart';
import 'package:myapp/src/router/router.dart';

class XCoordinator {
  static XRouter get rootRouter => GetIt.I<XRouter>();
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final shellKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;

  static void pop<T extends Object?>([T? result]) => context.pop(result);

  static void goNamed(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) =>
      context.goNamed(
        name,
        params: params,
        queryParams: queryParams,
        extra: extra,
      );

  static void showHomeScreen() => context.goNamed(XRouteNames.home.name);
  static void showAccountScreen() => context.goNamed(XRouteNames.account.name);

  static Future<T?> showSignInScreen<T extends Object?>() =>
      context.pushNamed<T>(XRouteNames.signIn.name);

  static Future<T?> showSignUpScreen<T extends Object?>() =>
      context.pushNamed<T>(XRouteNames.signUp.name);

  static Future<T?> showForgotPasswordScreen<T extends Object?>() =>
      context.pushNamed<T>(XRouteNames.forgotPassword.name);

  static Future<T?> showSampleScreen<T extends Object?>() =>
      context.pushNamed<T>(XRouteNames.sample.name);

  static Future<T?> showSampleDetails<T extends Object?>(
          {required String id}) =>
      context.pushNamed<T>(
        XRouteNames.sampleDetails.name,
        params: {XRouteNames.sampleDetails.paramName!: id},
      );

  static Future<T?> showProfile<T extends Object?>() =>
      context.pushNamed<T>(XRouteNames.profile.name);
}
