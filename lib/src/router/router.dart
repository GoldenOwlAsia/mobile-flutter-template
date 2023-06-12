import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/_dev/dev_screen.dart';
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

import '../features/chat/features/chat_detail/view/chat_detail_notfound.dart';
import '../features/chat/features/chat_detail/view/chat_detail_view.dart';
import '../features/chat/features/chat_room/chat_room_view.dart';
import '../features/chat/features/photoview/photo_view.dart';
import '../features/chat/network/model/room/chat_room.dart';
import '../features/common/view/not_found_view.dart';
import '../features/friends/view/friends_view.dart';
import 'coordinator.dart';
import '../features/chat/router/extra/photo_view_extra.dart';
import 'route_name.dart';

class AppRouter {
  late final router = GoRouter(
    navigatorKey: AppCoordinator.navigatorKey,
    initialLocation: AppRouteNames.home.path,
    debugLogDiagnostics: kDebugMode,
    observers: [BotToastNavigatorObserver()],
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.signIn.path,
        name: AppRouteNames.signIn.name,
        builder: (_, __) => const SigninView(),
        routes: <RouteBase>[
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.signUp.subPath,
            name: AppRouteNames.signUp.name,
            builder: (_, __) => const SignupView(),
          ),
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.forgotPassword.subPath,
            name: AppRouteNames.forgotPassword.name,
            builder: (_, __) => const ForgotPasswordView(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: AppCoordinator.shellKey,
        builder: (context, state, child) => DashBoardScreen(
          currentItem: XNavigationBarItems.fromLocation(state.location),
          body: child,
        ),
        routes: <RouteBase>[
          GoRoute(
            path: AppRouteNames.home.path,
            name: AppRouteNames.home.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeView(),
            ),
            routes: <RouteBase>[
              GoRoute(
                parentNavigatorKey: AppCoordinator.navigatorKey,
                path: AppRouteNames.sample.subPath,
                name: AppRouteNames.sample.name,
                builder: (_, __) => const SampleItemListView(),
                routes: <RouteBase>[
                  GoRoute(
                    parentNavigatorKey: AppCoordinator.navigatorKey,
                    path: AppRouteNames.sampleDetails.buildSubPathParam,
                    name: AppRouteNames.sampleDetails.name,
                    builder: (_, state) {
                      final id =
                          state.params[AppRouteNames.sampleDetails.paramName]!;
                      return SampleItemDetailsView(id: id);
                    },
                  )
                ],
              )
            ],
          ),
          GoRoute(
            path: AppRouteNames.account.path,
            name: AppRouteNames.account.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AccountHomeView(),
            ),
            routes: <RouteBase>[
              GoRoute(
                path: AppRouteNames.profile.subPath,
                name: AppRouteNames.profile.name,
                builder: (_, __) => const ProfileView(),
              )
            ],
          ),
          GoRoute(
            path: AppRouteNames.dev.path,
            name: AppRouteNames.dev.name,
            builder: (_, __) => const DevScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRouteNames.friends.path,
        name: AppRouteNames.friends.name,
        builder: (_, __) => const FriendsView(),
      ),
      GoRoute(
        path: AppRouteNames.chatRooms.path,
        name: AppRouteNames.chatRooms.name,
        builder: (_, __) => const ChatRoomView(),
      ),
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.chatRoomDetail.path,
        name: AppRouteNames.chatRoomDetail.name,
        builder: (context, state) {
          final extra = state.extra;
          MChatRoom? room;
          if (extra != null && extra is MChatRoom) {
            room = extra;
          }
          if (room == null) {
            return const ChatDetailNotFound();
          } else {
            return ChatDetailView(room: room);
          }
        },
      ),
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.photoView.path,
        name: AppRouteNames.photoView.name,
        builder: (_, state) {
          PhotoViewExtra extra = state.extra as PhotoViewExtra;
          return PhotoViewPage(
            galleryItems: extra.galleryItems,
            initialIndex: extra.initialIndex,
          );
        },
      ),
    ],
    errorBuilder: (_, __) => const NotFoundView(),
  );
}
