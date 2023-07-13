import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../network/model/common/handle.dart';
import '../../../../../account/logic/account_bloc.dart';
import '../../../../network/chat_domain.dart';
import '../../../../network/model/member/chat_member.dart';
import '../../../../network/model/message/chat_message.dart';
import '../../../../network/model/room/chat_room.dart';

part 'chat_detail_state.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  ChatDetailCubit(MChatRoom room) : super(ChatDetailState.ds(room)) {
    startListenMessages();
  }

  // Cache video controller to avoid reload video
  Map<String, VideoPlayerController> videoControllers = {};
  VideoPlayerController getVideoController(String id, String url) {
    // Avoid 2 video same url
    final key = '$id-$url';
    if (videoControllers[key] == null) {
      videoControllers[key] = VideoPlayerController.network(url);
    }
    return videoControllers[key]!;
  }

  StreamSubscription? newMessageSubscription;
  StreamSubscription? historyMessageSubscription;

  final ItemScrollController listViewScrollController = ItemScrollController();
  final ItemPositionsListener listViewPositionsListener =
      ItemPositionsListener.create();

  @override
  Future<void> close() async {
    _decreaseUnseen();
    await newMessageSubscription?.cancel();
    await historyMessageSubscription?.cancel();
    return super.close();
  }

  void scrollToBottom() {
    listViewScrollController.scrollTo(
        index: 0, duration: const Duration(milliseconds: 400));
  }

  void scrollToMessage(String id) async {
    int indexScroll = state.listMessToShow.indexWhere((e) => e.id == id);
    if (indexScroll == -1) {
      await listViewScrollController.scrollTo(
          index: state.listMessToShow.length - 1,
          duration: const Duration(milliseconds: 300));
      // load more message then scroll
    } else {
      await listViewScrollController.scrollTo(
          index: indexScroll, duration: const Duration(milliseconds: 300));
    }
  }

  bool listenerScrollDelay = false;
  void checkScrollList() {
    listViewPositionsListener.itemPositions.addListener(
      () async {
        // check load more
        if (listenerScrollDelay) {
          return;
        }
        listenerScrollDelay = true;
        await Future.delayed(const Duration(milliseconds: 500));
        listenerScrollDelay = false;
        final lastIndex =
            listViewPositionsListener.itemPositions.value.last.index;
        if (lastIndex >= (state.listMessToShow.length - 1)) {
          loadMoreNextPage();
        }

        // check show scroll down button
        final showScrollDown = lastIndex >= state.messagePerPage;
        if (showScrollDown != state.showScrollDown) {
          emit(state.copyWith(showScrollDown: showScrollDown));
        }
      },
    );
  }

  // wait for check room detail before load message
  void startListenMessages() {
    _decreaseUnseen();
    final lastDocId = state.lastDocId;
    // listen new message
    startListenNewMessages(lastDocId);
    // listen next page message
    if (lastDocId != null) {
      startListenHistoryMessages(lastDocId);
      checkScrollList();
    }
  }

  Future startListenNewMessages(String? lastDocId) async {
    try {
      final Stream<List<MChatMessage>> messageStream = await ChatDomainManager()
          .chatMessage
          .getNewMessageFromIdStream(state.roomId, lastDocId);

      await newMessageSubscription?.cancel();
      newMessageSubscription = messageStream.listen((messages) async {
        if (messages.isNotEmpty) {
          MChatMessage messageNew = messages.first;
          if (messageNew.isRead == false &&
              messageNew.idUserFrom != state.currentId) {
            // this is a new message from other. mark seen now
            await ChatDomainManager().chatMessage.updateReadMessage(messageNew);
          }
        }
        // Else: Beside have new message, this list also update When user reaction or edit.
        emit(state.copyWith(messagesNew: messages));
      });
    } catch (e) {
      // Something went wrong with listen new message
      // XToast.error(e.toString());
    }
  }

  void loadMoreNextPage() async {
    // check is Loading
    if (state.statusLoadNextPage.isLoading == false &&
        state.hasMore &&
        state.lastDocId != null) {
      final count = state.currentCountHistoryMessage + state.messagePerPage;
      emit(state.copyWith(currentCountHistoryMessage: count));
      startListenHistoryMessages(state.lastDocId!);
    }
  }

  void startListenHistoryMessages(String lastDocId) async {
    try {
      emit(state.copyWith(statusLoadNextPage: MStatus.loading));
      final Stream<List<MChatMessage>> historyStream = await ChatDomainManager()
          .chatMessage
          .getHistoryFromIdStream(
              state.roomId, lastDocId, state.currentCountHistoryMessage);
      await historyMessageSubscription?.cancel();
      historyMessageSubscription = historyStream.listen((eventData) async {
        emit(state.copyWith(
          hasMore: eventData.length >= state.currentCountHistoryMessage,
          messagesHistory: eventData,
          statusLoadNextPage: MStatus.success,
        ));
      });
    } catch (_) {
      emit(state.copyWith(hasMore: false, statusLoadNextPage: MStatus.failure));
    }
  }

  void _decreaseUnseen() async {
    final MChatRoom room = state.room;
    if (room.id.isNotEmpty) {
      await ChatDomainManager()
          .chatRoom
          .readAllMessage(state.currentId, room.id);
    }
  }

  void onTapAvatar(MChatMember member) {}
}
