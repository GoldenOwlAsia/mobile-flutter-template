part of 'send_message_cubit.dart';

enum ShowInputType { node, keyboard, emoji, recordAudio }

class SendMessageState extends Equatable {
  const SendMessageState({
    required this.room,
    required this.sendMessage,
    this.contentMessage = '',
    this.recordAudio = const RecordAudioState(),
    this.isUploadFiles = false,
    required this.messageReply,
    required this.currentId,
    this.showInputType = ShowInputType.node,
  });

  factory SendMessageState.ds(MChatRoom room) {
    final currentId = GetIt.I<AccountBloc>().state.user.id;
    return SendMessageState(
      room: room,
      currentId: currentId,
      messageReply: MChatMessage.empty(),
      sendMessage: MHandle(),
    );
  }
  final ShowInputType showInputType;
  final RecordAudioState recordAudio;
  final bool isUploadFiles;
  final String contentMessage;
  final MChatRoom room;
  String get roomId => room.id;
  final String currentId;
  final MChatMessage messageReply;
  final MHandle<MChatMessage> sendMessage;

  String replyOwnerNameOf(String id) {
    if (id == currentId) {
      return S.text.chat_replied_yourself;
    }
    return room.memberOtherOf(id).name;
  }

  SendMessageState copySendNewMessage() {
    return copyWith(
      contentMessage: '',
      messageReply: MChatMessage.empty(),
      sendMessage: MHandle.loading(),
    );
  }

  SendMessageState copyWith({
    MHandle<MChatMessage>? sendMessage,
    String? contentMessage,
    RecordAudioState? recordAudio,
    bool? isUploadFiles,
    MChatRoom? room,
    MChatMessage? messageReply,
    String? currentId,
    ShowInputType? showInputType,
  }) {
    return SendMessageState(
      sendMessage: sendMessage ?? this.sendMessage,
      recordAudio: recordAudio ?? this.recordAudio,
      isUploadFiles: isUploadFiles ?? this.isUploadFiles,
      contentMessage: contentMessage ?? this.contentMessage,
      room: room ?? this.room,
      messageReply: messageReply ?? this.messageReply,
      currentId: currentId ?? this.currentId,
      showInputType: showInputType ?? this.showInputType,
    );
  }

  @override
  List<Object> get props => [
        recordAudio,
        isUploadFiles,
        sendMessage,
        contentMessage,
        room,
        messageReply,
        currentId,
        showInputType,
      ];
}
