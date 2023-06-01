// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_detail_cubit.dart';

class ChatDetailState extends Equatable {
  const ChatDetailState({
    required this.room,
    required this.messageReply,
    this.idLastHistory = '',
    this.messagesHistory = const [],
    this.messagesNew = const [],
    this.statusLoadRoomInfo = MStatus.initial,
    this.statusLoadNextPage = MStatus.initial,
    required this.currentId,
    this.hasMore = true,
    this.openMediaBar = false,
    this.openAudioBar = false,
    this.showScrollDown = false,
    this.messagePerPage = 15,
    this.currentCountHistoryMessage = 15,
  });

  factory ChatDetailState.ds(MChatRoom room) {
    final currentId = GetIt.I<AccountBloc>().state.user.id;
    return ChatDetailState(
      room: room,
      messageReply: MChatMessage.empty(),
      currentId: currentId,
      statusLoadNextPage: room.messageNew?.id.isNotEmpty != true
          ? MStatus.success
          : MStatus.loading,
    );
  }
  String get roomId => room.id;
  final MChatRoom room;

  final bool openMediaBar;
  final bool openAudioBar;
  final List<MChatMessage> messagesHistory;
  final List<MChatMessage> messagesNew;
  List<MChatMessage> get listMessToShow {
    final List<MChatMessage> data = [...messagesNew, ...messagesHistory];
    return data;
  }

  String? get lastDocId => room.messageNew?.id;

  final MStatus statusLoadRoomInfo;
  final MStatus statusLoadNextPage;
  final bool hasMore;
  final bool showScrollDown;
  final String currentId;
  final String idLastHistory;
  final MChatMessage messageReply;
  final int messagePerPage;
  final int currentCountHistoryMessage;

  bool stateBottomChangeWith(ChatDetailState previous) {
    return previous.openMediaBar != openMediaBar ||
        previous.openAudioBar != openAudioBar ||
        previous.messageReply != messageReply;
  }

  MChatMember currentMember() {
    return room.memberOf(currentId);
  }

  MChatMember otherMember() {
    return room.memberOtherOf(currentId);
  }

  @override
  List<Object> get props => [
        messagesHistory,
        messagesNew,
        statusLoadRoomInfo,
        statusLoadNextPage,
        currentId,
        listMessToShow,
        hasMore,
        idLastHistory,
        openMediaBar,
        openAudioBar,
        showScrollDown,
        messageReply,
        messagePerPage,
        currentCountHistoryMessage,
      ];

  ChatDetailState copyWith({
    MChatRoom? room,
    bool? openMediaBar,
    bool? openAudioBar,
    List<MChatMessage>? messagesHistory,
    List<MChatMessage>? messagesNew,
    MStatus? statusLoadRoomInfo,
    MStatus? statusLoadNextPage,
    bool? hasMore,
    bool? showScrollDown,
    String? currentId,
    String? idLastHistory,
    MChatMessage? messageReply,
    int? messagePerPage,
    int? currentCountHistoryMessage,
  }) {
    return ChatDetailState(
      room: room ?? this.room,
      openMediaBar: openMediaBar ?? this.openMediaBar,
      openAudioBar: openAudioBar ?? this.openAudioBar,
      messagesHistory: messagesHistory ?? this.messagesHistory,
      messagesNew: messagesNew ?? this.messagesNew,
      statusLoadRoomInfo: statusLoadRoomInfo ?? this.statusLoadRoomInfo,
      statusLoadNextPage: statusLoadNextPage ?? this.statusLoadNextPage,
      hasMore: hasMore ?? this.hasMore,
      showScrollDown: showScrollDown ?? this.showScrollDown,
      currentId: currentId ?? this.currentId,
      idLastHistory: idLastHistory ?? this.idLastHistory,
      messageReply: messageReply ?? this.messageReply,
      messagePerPage: messagePerPage ?? this.messagePerPage,
      currentCountHistoryMessage:
          currentCountHistoryMessage ?? this.currentCountHistoryMessage,
    );
  }
}
