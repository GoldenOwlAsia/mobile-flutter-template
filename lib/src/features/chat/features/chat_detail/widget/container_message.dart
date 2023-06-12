import 'package:flutter/material.dart';
import '../../../theme/chat_theme.dart';

class ContainerMessage extends StatelessWidget {
  const ContainerMessage(this.isYour,
      {super.key, this.child, this.haveReply = false});
  final Widget? child;
  final bool isYour;
  final bool haveReply;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(20);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: haveReply ? Radius.zero : radius,
          topLeft: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        color: ChatTheme.of(context).messageBackgroundColor(isYour),
      ),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }
}
