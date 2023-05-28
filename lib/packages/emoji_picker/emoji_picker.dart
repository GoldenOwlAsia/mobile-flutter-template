import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import 'custom/emoji_picker_widget.dart';

class XEmojiPicker extends StatelessWidget {
  const XEmojiPicker(
      {super.key, this.onEmojiSelected, this.textEditingController});
  final TextEditingController? textEditingController;

  final Function(Category?, Emoji)? onEmojiSelected;

  static Future<String?> show(BuildContext context) {
    return showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return XEmojiPicker(
          onEmojiSelected: (p0, p1) async {
            Navigator.of(context).pop(p1.emoji);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return EmojiPicker(
      onEmojiSelected: onEmojiSelected,
      textEditingController: textEditingController,
      config: const Config(
        columns: 7,
        emojiSizeMax: 32,
        verticalSpacing: 0,
        horizontalSpacing: 0,
        gridPadding: EdgeInsets.zero,
        initCategory: Category.RECENT,
        bgColor: Color(0xFFF2F2F2),
        indicatorColor: Colors.blue,
        iconColor: Colors.grey,
        iconColorSelected: Colors.blue,
        backspaceColor: Colors.blue,
        skinToneDialogBgColor: Colors.white,
        skinToneIndicatorColor: Colors.grey,
        enableSkinTones: false,
        showRecentsTab: true,
        recentsLimit: 28,
        replaceEmojiOnLimitExceed: false,
        loadingIndicator: SizedBox.shrink(),
        tabIndicatorAnimDuration: kTabScrollDuration,
        categoryIcons: CategoryIcons(),
        buttonMode: ButtonMode.MATERIAL,
        checkPlatformCompatibility: true,
      ),
      customWidget: (config, state) => EmojiPickerWidget(config, state),
    );
  }
}
