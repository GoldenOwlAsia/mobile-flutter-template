import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/chat/theme/chat_theme.dart';
import 'package:myapp/widgets/image/image_network.dart';
import '../../../theme/chat_colors.dart';
import '../../../widget/image_avatar.dart';
import '../../../../../localization/localization_utils.dart';
import '../../../network/model/media/chat_media.dart';
import '../../../network/model/member/chat_member.dart';
import '../../../network/model/message/chat_message.dart';
import '../../../theme/chat_constants.dart';
import '../logic/chat_detail/chat_detail_cubit.dart';
import '../logic/send_message/send_message_cubit.dart';
import 'content_message_item.dart';

class MessageItemCard extends StatelessWidget {
  const MessageItemCard({
    super.key,
    required this.message,
    required this.isYour,
    required this.onTapAvatar,
    required this.onLongPressMessage,
    required this.chatMember,
    required this.showAvatar,
  });
  final MChatMessage message;
  final MChatMember chatMember;
  final bool isYour;
  final bool showAvatar;
  final Function(MChatMember) onTapAvatar;
  final Function(MChatMessage) onLongPressMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isYour ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (isYour == false && showAvatar)
            SizedBox(
              width: 36,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () => onTapAvatar(chatMember),
                child: XAvatarImage(
                  chatMember.avatar,
                  name: chatMember.name,
                  size: 36,
                ),
              ),
            ),
          const SizedBox(width: 12),
          if (isYour && message.reactions.isNotEmpty)
            _reactionsMessage(message),
          Flexible(
            child: Container(
              constraints: BoxConstraints(maxWidth: ChatConstants.maxWidth),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    isYour ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  if (message.messageReply?.id.isNotEmpty == true)
                    _replyMessage(context, message.messageReply!),
                  InkWell(
                    borderRadius: ChatConstants.borderRadius,
                    onLongPress: () => onLongPressMessage(message),
                    child: ContentMessageItem(message, isYour: isYour),
                  ),
                ],
              ),
            ),
          ),
          if (!isYour && message.reactions.isNotEmpty)
            _reactionsMessage(message),
        ],
      ),
    );
  }

  Widget _replyMessage(BuildContext context, MChatMessage message) {
    final primaryColor = ChatTheme.of(context).primaryColor;
    final messageOwner = context
        .read<SendMessageCubit>()
        .state
        .replyOwnerNameOf(message.idUserFrom);
    const radius = Radius.circular(10);
    return InkWell(
      onTap: () => context.read<ChatDetailCubit>().scrollToMessage(message.id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        constraints: const BoxConstraints(maxWidth: 200),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: radius,
              topLeft: radius,
              bottomLeft: radius,
              bottomRight: Radius.zero,
            ),
            color: ChatColors.grey4),
        child: Column(
          crossAxisAlignment:
              isYour ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                      child: Icon(Icons.reply, color: primaryColor, size: 16)),
                  TextSpan(
                    text: S.of(context).chat_replied_to(messageOwner),
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            getContentInReply(context, message)
          ],
        ),
      ),
    );
  }

  Widget getContentInReply(BuildContext context, MChatMessage message) {
    if (message.medias.isNotEmpty) {
      final MChatMedia media = message.medias.first;
      final MChatMediaType mediaType = media.fileType;

      switch (mediaType) {
        case MChatMediaType.image:
          return Container(
            constraints: const BoxConstraints(maxHeight: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ChatColors.grey,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: XImageNetwork(media.url),
            ),
          );

        default:
          break;
      }
    }
    return Text(
      message.getContentInReply(),
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _reactionsMessage(MChatMessage message) {
    var middle = (46 / 2) - 7.5;
    var left = middle - 8;
    var right = middle + 8;
    Map<String, int> reactions = message.mapReactions;
    final numberReactions = message.reactions.length;
    List<String> keys = List.from(reactions.keys);
    if (keys.length == 2) {
      middle = middle + 4;
      left = left + 4;
    } else if (keys.length == 1) {
      left = middle;
    }

    keys.sort((a, b) => (reactions[b] ?? 0).compareTo((reactions[a] ?? 0)));
    Widget iconOf(double left, String text) => Positioned(
          left: left,
          child: Text(text, style: const TextStyle(fontSize: 12.0, height: 1)),
        );
    return SizedBox(
      width: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 46,
            height: 12,
            child: Stack(
              children: [
                if (keys.length >= 3) iconOf(right, keys[2]),
                if (keys.length >= 2) iconOf(middle, keys[1]),
                iconOf(left, keys[0]),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Text('+$numberReactions', style: const TextStyle(fontSize: 12.0)),
        ],
      ),
    );
  }
}
