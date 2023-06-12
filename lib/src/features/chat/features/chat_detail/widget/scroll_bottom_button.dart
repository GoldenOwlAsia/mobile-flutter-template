import 'package:flutter/material.dart';

import '../../../../../theme/decorations.dart';
import '../../../theme/chat_colors.dart';

class ScrollToBottomButton extends StatelessWidget {
  const ScrollToBottomButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: ChatColors.grey4,
            shape: BoxShape.circle,
            boxShadow: AppDecorations.shadow),
        child: Icon(
          Icons.arrow_downward_outlined,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
