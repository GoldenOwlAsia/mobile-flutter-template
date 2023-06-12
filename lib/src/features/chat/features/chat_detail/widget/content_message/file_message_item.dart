import 'package:flutter/material.dart';
import '../../../../network/model/media/chat_media.dart';
import '../../../../theme/chat_theme.dart';
import '../container_message.dart';

class FilesMessageItem extends StatelessWidget {
  const FilesMessageItem(
      {super.key, required this.isYour, required this.media});
  final bool isYour;
  final MChatMedia media;
  @override
  Widget build(BuildContext context) {
    return ContainerMessage(
      isYour,
      child: Row(
        children: [
          Icon(
            Icons.file_present_rounded,
            color: ChatTheme.of(context).messageTextColor(isYour),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              media.url,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: ChatTheme.of(context).messageTextColor(isYour),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
