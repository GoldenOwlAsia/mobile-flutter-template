import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import '../../../network/model/common/error_code.dart';
import '../../../network/model/common/handle.dart';
import '../../account/logic/account_bloc.dart';
import '../../common/logic/stream_bloc.dart';
import '../network/chat_domain.dart';
import '../network/model/online/chat_online.dart';
import '../network/model/room/chat_room.dart';

part 'chat_room_state.dart';

class ChatRoomCubit extends StreamCubit<ChatRoomState, List<MChatRoom>> {
  ChatRoomCubit() : super(ChatRoomState.ds());

  StreamSubscription? onlineSubscription;

  @override
  Stream<List<MChatRoom>> get getStream =>
      ChatDomainManager().chatRoom.getChatRoomsStream();

  @override
  Future<void> close() {
    onlineSubscription?.cancel();
    return super.close();
  }

  @override
  void onStreamData(List<MChatRoom>? data) {
    emit(state.copyWith(data: MHandle.completed(data ?? [])));
    startListenOnline();
  }

  @override
  void onStreamError(error) {
    emit(state.copyWith(data: MHandle.error(error)));
  }

  Future startListenOnline() async {
    try {
      emit(state.copyWith(onlineData: MHandle.loading()));
      List<String> ids = state.data.data?.map((room) {
            return room.userIds
                .firstWhere((id) => state.currentId != id, orElse: () => '');
          }).toList() ??
          [];
      ids = ids.where((e) => e.isNotEmpty).toList();
      final Stream<List<MChatOnline>> onlineStream =
          ChatDomainManager().chatOnline.snapshotMultipleOnlineStream(ids);
      await onlineSubscription?.cancel();
      onlineSubscription = onlineStream.listen((event) async {
        emit(state.copyWith(onlineData: MHandle.completed(event)));
      });
    } catch (e) {
      emit(state.copyWith(onlineData: MHandle.error(MErrorCode.unknown)));
    }
  }

  void onSearchChange(String value) {
    emit(state.copyWith(searchValue: value));
  }
}
