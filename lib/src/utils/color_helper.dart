import 'dart:math' as math;

import 'package:flutter/material.dart';

class ColorHelper {
  static Color randomPrimaries() {
    return randomColor(Colors.primaries);
  }

  static Color randomAccent() {
    return randomColor(Colors.accents);
  }

  static Color randomColor(List<Color> colors) {
    final index = math.Random().nextInt(colors.length);
    return colors[index];
  }

  static Color getColorPrimariesByUserName(String? name) {
    return getColorByUserName(Colors.primaries, name);
  }

  static Color getColorAccentByUserName(String? name) {
    return getColorByUserName(Colors.accents, name);
  }

  static Color getColorByUserName(List<Color> colors, String? name) {
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
