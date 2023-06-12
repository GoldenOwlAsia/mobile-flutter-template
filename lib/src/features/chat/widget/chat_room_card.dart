import 'package:flutter/material.dart';
import '../theme/chat_colors.dart';
import 'image_avatar.dart';
import '../../../utils/date/date_helper.dart';
import '../network/model/member/chat_member.dart';
import '../network/model/message/chat_message.dart';
import '../network/model/room/chat_room.dart';
import '../router/chat_coordinator.dart';
import 'count_unseen_badge.dart';

class ChatRoomCard extends StatelessWidget {
  const ChatRoomCard({
    required this.chatRoom,
    required this.currentId,
    this.isOnline = false,
    super.key,
  });

  final MChatRoom chatRoom;
  final String currentId;
  final bool isOnline;
  @override
  Widget build(BuildContext context) {
    MChatMember member = chatRoom.memberOtherOf(currentId);
    MChatMessage? messageNew = chatRoom.messageNew;

    return InkWell(
      onTap: () => ChatCoordinator.showChatRoomDetail(context, chatRoom),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: _buildAvatar(member),
        title: _buildTitle(member),
        subtitle: (messageNew != null) ? _buildSubTitle(member) : null,
      ),
    );
  }

  Widget _buildAvatar(MChatMember member) {
    const double imageSize = 60;
    final avatarImage =
        XAvatarImage(member.avatar, name: member.name, size: imageSize);
    final leading = isOnline
        ? SizedBox(
            width: imageSize,
            height: imageSize,
            child: Stack(
              children: [
                avatarImage,
                Positioned(
                  right: 0,
                  bottom: 0,
                  width: 18,
                  height: 18,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        : avatarImage;
    return leading;
  }

  Widget _buildTitle(MChatMember member) {
    return _rowOf(
        title: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          member.name,
          style: const TextStyle(
            color: ChatColors.black2,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        trailing: Text(
          DateHelper.getFormatChatTime(chatRoom.updatedAt.toDate()),
          style: const TextStyle(
              color: ChatColors.black2,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ));
  }

  Widget _buildSubTitle(MChatMember member) {
    final unRead = chatRoom.unReadOf(currentId);
    final style = TextStyle(
      color: ChatColors.black2,
      fontWeight: unRead ? FontWeight.w700 : FontWeight.w400,
      fontSize: 14,
    );
    Widget? trailing;
    if (chatRoom.messageNew != null) {
      if (chatRoom.messageNew!.idUserFrom != currentId &&
          member.countNewMessage > 0) {
        trailing = CountUnseenBadge(count: member.countNewMessage);
      } else if (chatRoom.messageNew!.isRead == true &&
          chatRoom.messageNew!.idUserFrom == currentId) {
        trailing = const Icon(Icons.checklist_rtl, size: 8);
      }
    }
    return _rowOf(
      title: Text(
        chatRoom.getContentLastMessage(currentId),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
      trailing: trailing,
    );
  }

  Row _rowOf({required Widget title, Widget? trailing}) {
    return Row(
      children: [Expanded(child: title), if (trailing != null) trailing],
    );
  }
}
