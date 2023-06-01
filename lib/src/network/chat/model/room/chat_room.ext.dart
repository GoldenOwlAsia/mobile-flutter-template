part of 'chat_room.dart';

extension MChatRoomExt on MChatRoom {
  String getContentLastMessage(String currentId) {
    final message = messageNew;
    if (message != null) {
      String content = '';
      if (message.messageReply?.id.isNotEmpty == true) {
        content = S.text.chat_room_this_is_reply;
      } else if (message.medias.isEmpty) {
        content = message.content;
      } else {
        switch (message.medias.first.fileType) {
          case MChatMediaType.image:
            content = S.text.chat_room_this_is_photo;
            break;
          case MChatMediaType.audio:
            content = S.text.chat_room_this_is_audio;
            break;
          case MChatMediaType.video:
            content = S.text.chat_room_this_is_video;
            break;
          default:
            content = S.text.chat_room_this_is_file;
            break;
        }
      }
      if (currentId == message.idUserFrom) {
        return S.text.chat_room_you(content);
      } else {
        final member = memberOf(message.idUserFrom);
        final memberName = member.name;
        return '$memberName: $content';
      }
    }
    return '';
  }

  int indexOf(String id) {
    return members.indexWhere((e) => e.id == id);
  }

  int indexOtherOf(String id) {
    return members.indexWhere((e) => e.id != id);
  }

  MChatMember memberOf(String id) {
    return members.firstWhere(
      (e) => e.id == id,
      orElse: () => const MChatMember(id: '', name: '', countNewMessage: 0),
    );
  }

  MChatMember memberOtherListOf(String id) {
    return members.firstWhere(
      (e) => e.id != id,
      orElse: () => const MChatMember(id: '', name: '', countNewMessage: 0),
    );
  }

  MChatMember memberOtherOf(String id) {
    return members.firstWhere(
      (e) => id != e.id,
      orElse: () => const MChatMember(id: '', name: '', countNewMessage: 0),
    );
  }

  bool unReadOf(String id) {
    if (messageNew != null) {
      return messageNew!.isRead == false && messageNew!.idUserFrom != id;
    }
    return false;
  }

  bool matchSearch(String text, String currentId) {
    final member = memberOtherListOf(currentId);
    return member.name.toLowerCase().contains(text.toLowerCase());
  }

  MChatRoom copyWithDecreaseUnseen(String userId, int unReadCount) {
    List<MChatMember> newMembers = [];
    for (var e in members) {
      if (e.id == userId) {
        newMembers.add(e.copyWith(countNewMessage: unReadCount));
      } else {
        newMembers.add(e.copyWith());
      }
    }
    return copyWith(updatedAt: Timestamp.now(), members: members);
  }
}
