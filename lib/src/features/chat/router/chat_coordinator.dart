import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../dialogs/toast_wrapper.dart';
import '../../../localization/localization_utils.dart';
import '../../../network/model/user/user.dart';
import 'extra/photo_view_extra.dart';
import '../../../router/route_name.dart';
import '../../account/logic/account_bloc.dart';
import '../network/chat_domain.dart';
import '../network/model/room/chat_room.dart';

class ChatCoordinator {
  static Future<T?> showChatRoom<T extends Object?>(
      BuildContext context) async {
    if (GetIt.I<AccountBloc>().state.isLogin) {
      return context.pushNamed<T>(AppRouteNames.chatRooms.name);
    } else {
      XToast.error(S.text.error_not_login_yet);
    }
    return null;
  }

  static Future showChatWithUser<T extends Object?>(
      BuildContext context, MUser item) async {
    if (GetIt.I<AccountBloc>().state.isLogin == false) {
      XToast.error(S.text.error_not_login_yet);
      return;
    }
    XToast.showLoading();
    final result = await ChatDomainManager().chatRoom.chatWithUser(item);
    XToast.hideLoading();
    if (result.isSuccess) {
      final room = result.data;
      // ignore: use_build_context_synchronously
      return showChatRoomDetail(context, room!);
    } else {
      XToast.error(result.error);
    }
    return null;
  }

  static Future<T?> showChatRoomDetail<T extends Object?>(
      BuildContext context, MChatRoom room) {
    if (room.messageNew == null) {
      // sync data
      ChatDomainManager().chatRoom.updateChatRoom(room);
    }
    return context.pushNamed<T>(AppRouteNames.chatRoomDetail.name, extra: room);
  }

  static Future<T?> showPhotoView<T extends Object?>(
      BuildContext context, List<String> items,
      {int initialIndex = 0}) {
    return context.pushNamed<T>(
      AppRouteNames.photoView.name,
      extra: PhotoViewExtra(items, initialIndex: initialIndex),
    );
  }
}
