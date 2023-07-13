import 'package:flutter/material.dart';
import 'package:myapp/widgets/image/image_network.dart';

import '../../../../../../localization/localization_utils.dart';
import '../../../../network/model/media/chat_media.dart';
import '../../../../network/model/message/chat_message.dart';
import '../../../../theme/chat_colors.dart';
import '../../../../theme/chat_theme.dart';

class ReplyMessageBar extends StatelessWidget {
  const ReplyMessageBar({
    Key? key,
    this.messageOwner,
    required this.message,
    required this.onCancelReply,
    required this.onClickReply,
  }) : super(key: key);
  final String? messageOwner;
  final MChatMessage message;
  final VoidCallback onCancelReply;
  final VoidCallback onClickReply;
  @override
  Widget build(BuildContext context) {
    final primaryColor = ChatTheme.of(context).primaryColor;
    final replyMessageIcon = _replyMessageIcon(context);
    return InkWell(
      onTap: onClickReply,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        width: double.maxFinite,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          color: ChatColors.grey4,
        ),
        child: IntrinsicHeight(
          child: Row(children: [
            Icon(Icons.reply, color: primaryColor),
            const SizedBox(width: 12),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              color: primaryColor,
              width: 2,
            ),
            const SizedBox(width: 8),
            if (replyMessageIcon != null) ...[
              replyMessageIcon,
              const SizedBox(width: 8),
            ],
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.of(context).chat_reply_to(messageOwner ?? ''),
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: Text(
                    message.getContentInReply(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 5, width: 10),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: onCancelReply,
              icon: const Icon(Icons.clear),
              color: primaryColor,
            ),
            const SizedBox(height: 5),
          ]),
        ),
      ),
    );
  }

  Widget? _replyMessageIcon(BuildContext context) {
    Widget containerOf(Widget child) {
      return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey,
          ),
          child: child);
    }

    if (message.medias.isEmpty) {
      return null;
    }
    final MChatMedia media = message.medias.first;
    final MChatMediaType mediaType = media.fileType;

    switch (mediaType) {
      case MChatMediaType.image:
        return containerOf(ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: XImageNetwork(media.url)));
      case MChatMediaType.video:
        return containerOf(const Icon(Icons.video_chat_outlined));
      case MChatMediaType.audio:
        return containerOf(const Icon(Icons.audio_file_outlined));
      case MChatMediaType.other:
        return containerOf(const Icon(Icons.file_present_outlined));
      default:
        return null;
    }
  }
}
