// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_room_cubit.dart';

class ChatRoomState extends Equatable {
  const ChatRoomState({
    required this.data,
    required this.onlineData,
    required this.currentId,
    this.searchValue = '',
  });
  factory ChatRoomState.ds() {
    final currentId = GetIt.I<AccountBloc>().state.user.id;
    return ChatRoomState(
      data: MHandle.loading(),
      onlineData: MHandle.loading(),
      currentId: currentId,
    );
  }

  final MHandle<List<MChatRoom>> data;
  final MHandle<List<MChatOnline>> onlineData;
  final String currentId;
  final String searchValue;

  bool isOnlineOfRom(MChatRoom room) {
    final id = room.userIds.firstWhere((e) => currentId != e, orElse: () => '');
    return isOnlineOfId(id);
  }

  bool isOnlineOfId(String id) {
    if (id.isNotEmpty) {
      try {
        return onlineData.data?.firstWhere((e) => e.id == id).isOnline ?? false;
      } catch (_) {
        return false;
      }
    }
    return false;
  }

  List<MChatRoom> get listChatAll {
    final rooms = data.data ?? [];
    return filterBySearch(rooms);
  }

  List<MChatRoom> get listChatOnline {
    final rooms = data.data?.where((e) => isOnlineOfRom(e)).toList() ?? [];
    return filterBySearch(rooms);
  }

  List<MChatRoom> filterBySearch(List<MChatRoom> rooms) {
    if (searchValue.trim().isEmpty) {
      return rooms;
    }
    return rooms.where((e) => e.matchSearch(searchValue, currentId)).toList();
  }

  @override
  List<Object?> get props => [
        data,
        onlineData,
        currentId,
        searchValue,
      ];

  ChatRoomState copyWith({
    MHandle<List<MChatRoom>>? data,
    MHandle<List<MChatOnline>>? onlineData,
    String? currentId,
    String? searchValue,
  }) {
    return ChatRoomState(
      data: data ?? this.data,
      onlineData: onlineData ?? this.onlineData,
      currentId: currentId ?? this.currentId,
      searchValue: searchValue ?? this.searchValue,
    );
  }
}
