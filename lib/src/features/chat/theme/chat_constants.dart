import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/screen.dart';

class ChatConstants {
  static final double maxWidth = AppScreens.width * 0.65;
  static final double maxHeight = AppScreens.height * 0.3;
  static List<String> emojis = ['🥰', '😆', '😮', '😢', '👍'];

  static Color messageBackgroundColor(bool isYour) =>
      isYour ? AppColors.primary : AppColors.lightGrey3;
  static Color messageTextColor(bool isYour) =>
      isYour ? AppColors.white : AppColors.black;

  static BorderRadius borderRadius = BorderRadius.circular(8);
  static const double spaceOfMedia = 6;
  static const double mapZoom = 16;
  static const Duration defaultDurationShareLocation = Duration(hours: 1);
}
