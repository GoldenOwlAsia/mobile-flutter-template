import 'package:flutter/material.dart';

class XTextButton extends StatelessWidget {
  const XTextButton({
    required this.title,
    this.onPressed,
    this.padding,
    super.key,
  });

  final String title;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding,
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
