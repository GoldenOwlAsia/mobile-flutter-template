import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/router/router_name.dart';
import 'package:myapp/src/router/auto_router.gr.dart';

class SignRoutes {
  static const String signup = 'sign-up';
  static const String forgotPassword = 'forgot-password';
}

class SignCoordinator {
  static var autoRouter = AutoRoute(
    path: XRoutes.authentication,
    page: SignRoute.page,
    children: [
      AutoRoute(path: '', page: SigninRoute.page),
      AutoRoute(path: SignRoutes.signup, page: SignupRoute.page),
      AutoRoute(
          path: SignRoutes.forgotPassword, page: ForgotPasswordRoute.page),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );

  static Future showSignup(BuildContext context) {
    return context.router.pushNamed(SignRoutes.signup);
  }

  static Future showForgotPassword(BuildContext context) {
    return context.router.pushNamed(SignRoutes.forgotPassword);
  }
}
