import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/features/common/view/not_found_view.dart';
import 'package:myapp/src/features/dashboard/logic/navigation_bar_item.dart';
import 'package:myapp/src/features/account/profile/view/profile_view.dart';
import 'package:myapp/src/features/account/view/account_view.dart';
import 'package:myapp/src/features/authentication/view/forgot_view.dart';
import 'package:myapp/src/features/authentication/view/signin_view.dart';
import 'package:myapp/src/features/authentication/view/signup_view.dart';
import 'package:myapp/src/features/dashboard/view/dashboard_view.dart';
import 'package:myapp/src/features/home/view/home_view.dart';
import 'package:myapp/src/features/photo_view/photo_view_page.dart';
import 'package:myapp/src/features/sample/view/sample_detail_view.dart';
import 'package:myapp/src/features/sample/view/sample_list_view.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/router/extras/photo_view_extra.dart';
import 'package:myapp/src/router/route_name.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AppRouter {
  late final router = GoRouter(
    navigatorKey: AppCoordinator.navigatorKey,
    initialLocation: AppRouteNames.home.path,
    debugLogDiagnostics: kDebugMode,
    observers: [BotToastNavigatorObserver(), SentryNavigatorObserver()],
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.signIn.path,
        name: AppRouteNames.signIn.routeName,
        builder: (_, _) => const SigninView(),
        routes: <RouteBase>[
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.signUp.subPath,
            name: AppRouteNames.signUp.routeName,
            builder: (_, _) => const SignupView(),
          ),
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.forgotPassword.subPath,
            name: AppRouteNames.forgotPassword.routeName,
            builder: (_, _) => const ForgotPasswordView(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: AppCoordinator.shellKey,
        builder: (context, state, child) => DashBoardScreen(
          currentItem: XNavigationBarItems.fromLocation(state.uri.toString()),
          body: child,
        ),
        routes: <RouteBase>[
          GoRoute(
            path: AppRouteNames.home.path,
            name: AppRouteNames.home.routeName,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeView()),
            routes: <RouteBase>[
              GoRoute(
                parentNavigatorKey: AppCoordinator.navigatorKey,
                path: AppRouteNames.sample.subPath,
                name: AppRouteNames.sample.routeName,
                builder: (_, _) => const SampleItemListView(),
                routes: <RouteBase>[
                  GoRoute(
                    parentNavigatorKey: AppCoordinator.navigatorKey,
                    path: AppRouteNames.sampleDetails.buildSubPathParam,
                    name: AppRouteNames.sampleDetails.routeName,
                    builder: (_, state) {
                      final id =
                          state.pathParameters[AppRouteNames
                              .sampleDetails
                              .paramName]!;
                      return SampleItemDetailsView(id: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: AppRouteNames.account.path,
            name: AppRouteNames.account.routeName,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: AccountHomeView()),
            routes: <RouteBase>[
              GoRoute(
                path: AppRouteNames.profile.subPath,
                name: AppRouteNames.profile.routeName,
                builder: (_, _) => const ProfileView(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.photoView.path,
        name: AppRouteNames.photoView.routeName,
        builder: (_, state) {
          final extra = state.extra;
          if (extra is! PhotoViewExtra) {
            return const NotFoundView();
          }
          return PhotoViewPage(
            galleryItems: extra.galleryItems,
            initialIndex: extra.initialIndex,
          );
        },
      ),
    ],
    errorBuilder: (_, _) => const NotFoundView(),
  );
}
