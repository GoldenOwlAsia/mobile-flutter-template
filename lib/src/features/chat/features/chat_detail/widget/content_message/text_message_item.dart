import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../../../network/chat/model/message/chat_message.dart';
import '../../../../theme/chat_constants.dart';
import '../container_message.dart';
import 'preview_link/linkify_widget.dart';
import 'preview_link/preview_link_widget.dart';

class TextMessageItem extends StatelessWidget {
  const TextMessageItem(
      {super.key, required this.isYour, required this.message});
  final bool isYour;
  final MChatMessage message;
  @override
  Widget build(BuildContext context) {
    if (message.content.isShowEmoji) {
      return Container(
        padding: const EdgeInsets.only(bottom: 0),
        child: Text(
          message.content,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 80,
            color: ChatConstants.messageTextColor(isYour),
          ),
        ),
      );
    }
    final child = ContainerMessage(
      isYour,
      haveReply: message.messageReply?.id.isNotEmpty == true,
      child: LinkifyWidget(
        text: message.content,
        color: ChatConstants.messageTextColor(isYour),
        options: const LinkifyOptions(humanize: false),
        onOpen: (link) => launchUrlString(link.url),
      ),
    );
    final links = message.extractLinkFromText();
    if (links.isEmpty) {
      return child;
    }
    return Column(
      crossAxisAlignment:
          isYour ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        child,
        for (final link in links)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: MetadataLinkWidget(
              link,
              isYour: isYour,
            ),
          )
      ],
    );
  }
}
