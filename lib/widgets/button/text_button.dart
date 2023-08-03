import 'package:flutter/material.dart';

import '../common/indicator.dart';

class XTextButton extends StatelessWidget {
  const XTextButton({
    this.onPressed,
    this.title,
    this.child,
    this.busy = false,
    this.enabled = true,
    super.key,
  });

  final bool busy;
  final bool enabled;
  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled
          ? () {
              if (onPressed != null || busy == false) {
                onPressed?.call();
              }
            }
          : null,
      child: busy ? const XIndicator(radius: 12) : (child ?? Text(title ?? '')),
    );
  }
}
