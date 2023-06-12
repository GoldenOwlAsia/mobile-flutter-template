// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'inherited_chat_theme.dart';

/// Base chat theme containing all required properties to make a theme.
/// Extend this class if you want to create a custom theme.
@immutable
abstract class ChatTheme {
  /// Creates a new chat theme based on provided colors and text styles.
  const ChatTheme({
    required this.backgroundColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.currentUserTheme,
    required this.otherUserTheme,
  });

  static ChatTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedChatTheme>()!.theme;

  /// Used as a background color of a chat widget.
  final Color backgroundColor;

  /// Primary color of the chat used as a background of sent messages
  /// and statuses
  final Color primaryColor;

  /// Secondary color, used as a background of received messages.
  final Color secondaryColor;

  final ChatMessageTheme currentUserTheme;
  final ChatMessageTheme otherUserTheme;

  Color messageBackgroundColor(bool isYour) {
    return isYour ? currentUserTheme.background : otherUserTheme.background;
  }

  Color messageTextColor(bool isYour) {
    return isYour ? currentUserTheme.onBackground : otherUserTheme.onBackground;
  }
}

/// Default chat theme which extends [ChatTheme].
@immutable
class DefaultChatTheme extends ChatTheme {
  const DefaultChatTheme({
    super.backgroundColor = const Color(0xFFF9F6EE),
    super.primaryColor = const Color(0xfffe48bb),
    super.secondaryColor = const Color(0xff6f61e8),
    super.currentUserTheme = const ChatMessageTheme(
        background: Color(0xfffe48bb), onBackground: Colors.white),
    super.otherUserTheme = const ChatMessageTheme(
        background: Color(0xFFD2D2D2), onBackground: Color(0xFF020202)),
  });

  /// Creates a default chat theme. Use this constructor if you want to
  /// override only a couple of properties, otherwise create a new class
  /// which extends [ChatTheme]
}

class ChatMessageTheme {
  final Color background;
  final Color onBackground;
  const ChatMessageTheme({
    required this.background,
    required this.onBackground,
  });
}
