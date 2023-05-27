import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/features/dashboard/logic/navigation_bar_item.dart';
import 'package:myapp/src/features/account/profile/view/profile_view.dart';
import 'package:myapp/src/features/account/view/account_view.dart';
import 'package:myapp/src/features/authentication/view/forgot_view.dart';
import 'package:myapp/src/features/authentication/view/signin_view.dart';
import 'package:myapp/src/features/authentication/view/signup_view.dart';
import 'package:myapp/src/features/dashboard/view/dashboard_view.dart';
import 'package:myapp/src/features/home/view/home_view.dart';
import 'package:myapp/src/features/sample/view/sample_detail_view.dart';
import 'package:myapp/src/features/sample/view/sample_list_view.dart';

import '../features/common/view/not_found_view.dart';
import 'coordinator.dart';
import 'route_name.dart';

class XRouter {
  late final router = GoRouter(
    navigatorKey: XCoordinator.navigatorKey,
    initialLocation: XRouteNames.home.path,
    debugLogDiagnostics: kDebugMode,
    observers: [BotToastNavigatorObserver()],
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: XCoordinator.navigatorKey,
        path: XRouteNames.signIn.path,
        name: XRouteNames.signIn.name,
        builder: (_, __) => const SigninView(),
        routes: <RouteBase>[
          GoRoute(
            parentNavigatorKey: XCoordinator.navigatorKey,
            path: XRouteNames.signUp.subPath,
            name: XRouteNames.signUp.name,
            builder: (_, __) => const SignupView(),
          ),
          GoRoute(
            parentNavigatorKey: XCoordinator.navigatorKey,
            path: XRouteNames.forgotPassword.subPath,
            name: XRouteNames.forgotPassword.name,
            builder: (_, __) => const ForgotPasswordView(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: XCoordinator.shellKey,
        builder: (context, state, child) => DashBoardScreen(
          currentItem: XNavigationBarItems.fromLocation(state.location),
          body: child,
        ),
        routes: <RouteBase>[
          GoRoute(
            path: XRouteNames.home.path,
            name: XRouteNames.home.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeView(),
            ),
            routes: <RouteBase>[
              GoRoute(
                parentNavigatorKey: XCoordinator.navigatorKey,
                path: XRouteNames.sample.subPath,
                name: XRouteNames.sample.name,
                builder: (_, __) => const SampleItemListView(),
                routes: <RouteBase>[
                  GoRoute(
                    parentNavigatorKey: XCoordinator.navigatorKey,
                    path: XRouteNames.sampleDetails.buildSubPathParam,
                    name: XRouteNames.sampleDetails.name,
                    builder: (_, state) {
                      final id =
                          state.params[XRouteNames.sampleDetails.paramName]!;
                      return SampleItemDetailsView(id: id);
                    },
                  )
                ],
              )
            ],
          ),
          GoRoute(
            path: XRouteNames.account.path,
            name: XRouteNames.account.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AccountHomeView(),
            ),
            routes: <RouteBase>[
              GoRoute(
                path: XRouteNames.profile.subPath,
                name: XRouteNames.profile.name,
                builder: (_, __) => const ProfileView(),
              )
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (_, __) => const NotFoundView(),
  );
}
