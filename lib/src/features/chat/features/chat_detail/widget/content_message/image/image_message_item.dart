import 'package:flutter/material.dart';
import '../../../../../network/model/media/chat_media.dart';
import 'image_grid_widget.dart';

class ImageMessageItem extends StatelessWidget {
  const ImageMessageItem(
      {super.key, required this.isYour, required this.photos});
  final bool isYour;
  final List<MChatMedia> photos;
  @override
  Widget build(BuildContext context) {
    return ImageGirdWidget(photos);
  }
}
