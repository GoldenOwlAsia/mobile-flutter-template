import 'package:flutter/material.dart';
import '../../../network/model/message/chat_message.dart';
import 'content_message/audio_message_item.dart';
import 'content_message/file_message_item.dart';
import 'content_message/image/image_message_item.dart';
import 'content_message/text_message_item.dart';
import 'content_message/video/video_message_item.dart';

class ContentMessageItem extends StatelessWidget {
  const ContentMessageItem(
    this.message, {
    super.key,
    required this.isYour,
  });
  final bool isYour;
  final MChatMessage message;

  @override
  Widget build(BuildContext context) {
    if (message.medias.isEmpty) {
      return TextMessageItem(isYour: isYour, message: message);
    }
    if (message.medias.length == 1) {
      final media = message.medias.first;
      switch (media.fileType) {
        case MChatMediaType.image:
          return ImageMessageItem(isYour: isYour, photos: message.photos);
        case MChatMediaType.audio:
          return AudioMessageItem(
            media,
            isYour: isYour,
          );
        case MChatMediaType.video:
          return VideoMessageItem(
              message: message, isYour: isYour, media: media);
        case MChatMediaType.other:
          return FilesMessageItem(isYour: isYour, media: media);
      }
    } else {
      final audios = message.audios;
      final photos = message.photos;
      final videos = message.videos;
      final others = message.others;
      if (audios.isEmpty && videos.isEmpty && others.isEmpty) {
        return ImageMessageItem(isYour: isYour, photos: photos);
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (audios.isNotEmpty)
            for (final e in audios) AudioMessageItem(e, isYour: isYour),
          if (videos.isNotEmpty)
            for (final e in videos)
              VideoMessageItem(message: message, media: e, isYour: isYour),
          if (others.isNotEmpty)
            for (final e in others) FilesMessageItem(media: e, isYour: isYour),
          if (photos.isEmpty) ImageMessageItem(isYour: isYour, photos: photos),
        ],
      );
    }
  }
}
