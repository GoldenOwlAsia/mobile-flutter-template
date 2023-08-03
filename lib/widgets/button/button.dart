import 'package:flutter/material.dart';
import 'package:myapp/widgets/common/indicator.dart';

import 'model/button_size.dart';

/// A button that shows a busy indicator in place of title
class XButton extends StatelessWidget {
  final bool busy;
  final bool enabled;
  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;
  final ButtonSize? size;

  const XButton({
    this.onPressed,
    this.title,
    this.child,
    this.busy = false,
    this.enabled = true,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = this.size ?? ButtonSize.medium();
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(size.minWidth, size.height),
          padding: EdgeInsets.symmetric(horizontal: size.padding),
        ),
      ),
      child: ElevatedButton(
        onPressed: enabled
            ? () {
                if (onPressed != null || busy == false) {
                  onPressed?.call();
                }
              }
            : null,
        child: DefaultTextStyle(
          style: size.style,
          child: busy
              ? const XIndicator(radius: 12)
              : (child ?? Text(title ?? '')),
        ),
      ),
    );
  }
}
