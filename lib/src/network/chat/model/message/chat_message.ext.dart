part of 'chat_message.dart';

extension MChatMessageExt on MChatMessage {
  List<MChatMedia> get photos =>
      medias.where((e) => e.fileType == MChatMediaType.image).toList();
  List<MChatMedia> get videos =>
      medias.where((e) => e.fileType == MChatMediaType.video).toList();
  List<MChatMedia> get audios =>
      medias.where((e) => e.fileType == MChatMediaType.audio).toList();
  List<MChatMedia> get others =>
      medias.where((e) => e.fileType == MChatMediaType.other).toList();

  String getContentInReply() {
    String result = '';
    if (medias.isEmpty) {
      result = content;
    } else {
      switch (medias.first.fileType) {
        case MChatMediaType.other:
          return S.text.chat_reply_content_of_file;
        case MChatMediaType.image:
          return S.text.chat_reply_content_of_photo;
        case MChatMediaType.video:
          return S.text.chat_reply_content_of_video;
        case MChatMediaType.audio:
          return S.text.chat_reply_content_of_audio;
        default:
          result = content;
          break;
      }
    }
    return result;
  }

  MChatMessage addReaction(String reaction, String userId) {
    final List<MChatReaction> newReactions = List.from(reactions);
    newReactions.add(MChatReaction(memberId: userId, reaction: reaction));
    return copyWith(reactions: newReactions);
  }

  Map<String, int> get mapReactions {
    Map<String, int> map = {};
    for (var element in reactions) {
      String icon = element.reaction;
      if (map[icon] != null) {
        map[icon] = map[icon]! + 1;
      } else {
        map[icon] = 1;
      }
    }
    return map;
  }

  List<String> extractLinkFromText() {
    final linkifyElement = linkify(content);
    final List<String> links = [];
    for (var e in linkifyElement) {
      final data = e.toString();
      if (data.contains('LinkElement')) {
        RegExp regExp = RegExp(r"'(.*?)'");
        Match? match = regExp.firstMatch(data);

        if (match != null) {
          String link = match.group(1)!;
          links.add(link);
        }
      }
    }
    return links;
  }
}

extension ChatContent on String {
  bool get isShowEmoji {
    RegExp rx = RegExp(
        r'[\p{Extended_Pictographic}\u{1F3FB}-\u{1F3FF}\u{1F9B0}-\u{1F9B3}]',
        unicode: true);
    if (characters.length == 1 && rx.allMatches(this).isNotEmpty) {
      return true;
    }
    return false;
  }
}
