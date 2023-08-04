import 'package:flutter/material.dart';
import 'package:myapp/widgets/common/indicator.dart';

import 'model/button_size.dart';

/// A button that shows a busy indicator in place of title
class XButton extends StatelessWidget {
  const XButton({
    this.onPressed,
    this.title,
    this.child,
    this.busy = false,
    this.enabled = true,
    this.size,
    super.key,
  });

  final bool busy;
  final bool enabled;
  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;
  final ButtonSize? size;

  @override
  Widget build(BuildContext context) {
    final size = this.size ?? ButtonSize.medium();
    return SizedBox(
      height: size.height,
      child: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            textStyle: size.style.copyWith(),
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
          child: busy
              ? const XIndicator(radius: 12)
              : (child ?? Text(title ?? '')),
        ),
      ),
    );
  }
}
