import 'package:flutter/material.dart';

import '../../../../../../../packages/emoji_picker/emoji_picker.dart';
import '../../../../../../../widgets/button/button.dart';
import '../../../../network/model/message/chat_message.dart';
import '../../../../theme/chat_colors.dart';
import '../../../../theme/chat_constants.dart';
import 'select_message.dart';

class SelectReactionDialog extends StatelessWidget {
  const SelectReactionDialog(this.message, {super.key});
  final MChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 345,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final e in ChatConstants.emojis) _buildEmoji(context, e),
                  _buildAddEmoji(context),
                ],
              ),
            ),
            const SizedBox(height: 8),
            XButton(
              title: 'Reply this message',
              onPressed: () {
                Navigator.of(context)
                    .pop(const SelectMessage(SelectMessageAction.reply));
              },
            )
          ],
        ),
      ),
    );
  }

  IconButton _buildAddEmoji(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final result = await XEmojiPicker.show(context);
        if (result != null) {
          // ignore: use_build_context_synchronously
          Navigator.of(context)
              .pop(SelectMessage(SelectMessageAction.reaction, result));
        }
      },
      icon: Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: ChatColors.black2)),
          child: const Icon(
            Icons.add_rounded,
            color: ChatColors.black2,
          )),
    );
  }

  Widget _buildEmoji(BuildContext context, String e) {
    return IconButton(
      onPressed: () {
        Navigator.of(context)
            .pop(SelectMessage(SelectMessageAction.reaction, e));
      },
      icon: Text(e, style: const TextStyle(fontSize: 30)),
    );
  }
}
