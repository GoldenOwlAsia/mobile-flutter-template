import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/features/chat/theme/chat_colors.dart';
import '../../../../widgets/common/shimmer.dart';

class XAvatarImage extends StatelessWidget {
  const XAvatarImage(
    this.imageUrl, {
    this.fit = BoxFit.cover,
    this.shape = BoxShape.circle,
    this.name,
    this.size,
    super.key,
  });

  final String? imageUrl;
  final String? name;
  final BoxFit fit;
  final BoxShape shape;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final double fontSize = size != null ? (size! / 3) : 20;
    final noImageWidget = Container(
        color: ChatColors.getColorByUserName(name),
        height: size,
        width: size,
        child: name?.isNotEmpty == true
            ? Center(
                child: Text(
                  name![0],
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            : null);

    final widget = imageUrl?.isNotEmpty == true
        ? CachedNetworkImage(
            width: size,
            height: size,
            imageUrl: imageUrl ?? '',
            fit: fit,
            placeholder: (context, url) => XShimmer(
              child: Container(width: size, height: size, color: Colors.grey),
            ),
            errorWidget: (context, url, error) => noImageWidget,
          )
        : noImageWidget;
    if (shape == BoxShape.circle) {
      return ClipOval(child: widget);
    }
    return widget;
  }
}
