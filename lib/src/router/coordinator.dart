import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/network/model/user/user.dart';
import 'package:myapp/src/router/route_name.dart';
import 'package:myapp/src/router/router.dart';

import '../dialogs/toast_wrapper.dart';
import '../network/chat/model/room/chat_room.dart';
import '../network/domain_manager.dart';
import 'extra/photo_view_extra.dart';

class AppCoordinator {
  static AppRouter get rootRouter => GetIt.I<AppRouter>();
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

  static void showHomeScreen() => context.goNamed(AppRouteNames.home.name);
  static void showAccountScreen() =>
      context.goNamed(AppRouteNames.account.name);

  static Future<T?> showSignInScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.signIn.name);

  static Future<T?> showSignUpScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.signUp.name);

  static Future<T?> showForgotPasswordScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.forgotPassword.name);

  static Future<T?> showSampleScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.sample.name);

  static Future<T?> showSampleDetails<T extends Object?>(
          {required String id}) =>
      context.pushNamed<T>(
        AppRouteNames.sampleDetails.name,
        params: {AppRouteNames.sampleDetails.paramName!: id},
      );

  static Future<T?> showProfile<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.profile.name);

  static Future<T?> showChatRoom<T extends Object?>() {
    return context.pushNamed<T>(AppRouteNames.chatRooms.name);
  }

  static Future<T?> showChatWithUser<T extends Object?>(MUser item) async {
    XToast.showLoading();
    final result = await DomainManager().chatRoom.chatWithUser(item);
    XToast.hideLoading();
    if (result.isSuccess) {
      final room = result.data;
      return showChatRoomDetail(room!);
    } else {
      XToast.error(result.error);
    }
    return null;
  }

  static Future<T?> showChatRoomDetail<T extends Object?>(MChatRoom room) {
    if (room.messageNew == null) {
      // sync data
      DomainManager().chatRoom.updateChatRoom(room);
    }
    return context.pushNamed<T>(AppRouteNames.chatRoomDetail.name, extra: room);
  }

  static Future<T?> showPhotoView<T extends Object?>(List<String> items,
      {int initialIndex = 0}) {
    return context.pushNamed<T>(
      AppRouteNames.photoView.name,
      extra: PhotoViewExtra(items, initialIndex: initialIndex),
    );
  }
}
