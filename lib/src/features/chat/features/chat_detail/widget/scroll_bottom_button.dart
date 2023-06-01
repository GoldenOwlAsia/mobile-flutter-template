import 'package:flutter/material.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/decorations.dart';

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
            color: AppColors.lightGrey,
            shape: BoxShape.circle,
            boxShadow: AppDecorations.shadow),
        child: const Icon(
          Icons.arrow_downward_outlined,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
