import 'package:flutter/material.dart';

class ChatColors {
  // For internal usage only. Use values from theme itself.
  static const grey = Color(0xFF8E8E8E);
  static const grey4 = Color(0xFFD1D1D1);
  static const black2 = Color(0xFF1E1E1E);

  /// See [ChatTheme.userAvatarNameColors]
  static const List<Color> colors = [
    Color(0xffff6767),
    Color(0xff66e0da),
    Color(0xfff5a2d9),
    Color(0xfff0c722),
    Color(0xff6a85e5),
    Color(0xfffd9a6f),
    Color(0xff92db6e),
    Color(0xff73b8e5),
    Color(0xfffd7590),
    Color(0xffc78ae5),
  ];

  static Color getColorByUserName(String? name) {
    final index = _getIndexOfTag(name, normalize: colors.length);
    return colors[index];
  }

  static int _getIndexOfTag(String? value, {int normalize = 10}) {
    if (value == null) {
      return 0;
    }
    if (value.isNotEmpty) {
      int length = value.length;
      int first = value.codeUnitAt(0);
      int last = value.codeUnitAt(length - 1);
      int total = first + last + length;
      int index = (total - 1) % normalize;
      return index;
    }
    return 0;
  }
}
