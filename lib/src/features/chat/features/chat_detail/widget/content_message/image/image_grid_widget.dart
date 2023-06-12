import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/widgets/image/image_network.dart';
import '../../../../../network/model/media/chat_media.dart';
import '../../../../../router/chat_coordinator.dart';
import '../../../../../theme/chat_constants.dart';

class ImageGirdWidget extends StatelessWidget {
  const ImageGirdWidget(this.media, {super.key});

  final List<MChatMedia> media;

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (media.length) {
      case 1:
        return _singleImage(context, media.first);
      case 2:
        child = SizedBox(
          height: 200,
          child: _buildImage2(context),
        );
        break;
      case 3:
        child = SizedBox(
          height: 300,
          child: _buildImage3(context),
        );
        break;
      case 4:
        child = SizedBox(
          height: 350,
          child: _buildImage4(context),
        );
        break;
      case 5:
        child = SizedBox(
          height: 300,
          child: _buildImage5(context),
        );
        break;
      default:
        child = gridViewImage(context);
        break;
    }
    return ClipRRect(
      borderRadius: ChatConstants.borderRadius,
      child: child,
    );
  }

  Widget _singleImage(BuildContext context, MChatMedia photo) {
    double? width;
    double? height;
    if (photo.noHasSize == false) {
      width = ChatConstants.maxWidth;
      height = ChatConstants.maxWidth * (photo.height! / photo.width!);
    }
    return GestureDetector(
      onTap: () {
        ChatCoordinator.showPhotoView(
            context, media.map((e) => e.url).toList());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: ChatConstants.borderRadius,
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: ClipRRect(
          borderRadius: ChatConstants.borderRadius,
          child: XImageNetwork(
            photo.url,
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }

  Widget _image(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        ChatCoordinator.showPhotoView(context, media.map((e) => e.url).toList(),
            initialIndex: index);
      },
      child: XImageNetwork(media[index].url, fit: BoxFit.cover),
    );
  }

  Widget dividerHorizontal() {
    return Container(height: 1, color: Colors.transparent);
  }

  Widget dividerVertical() {
    return Container(width: 1, color: Colors.transparent);
  }

  Widget _buildImage2(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: _image(context, 0),
        ),
        dividerVertical(),
        Expanded(child: _image(context, 1))
      ],
    );
  }

  Widget _buildImage3(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: _image(context, 0)),
        dividerVertical(),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _image(context, 1)),
              dividerHorizontal(),
              Expanded(child: _image(context, 2))
            ],
          ),
        )
      ],
    );
  }

  Widget _buildImage4(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _image(context, 0)),
              dividerHorizontal(),
              Expanded(child: _image(context, 1)),
            ],
          ),
        ),
        dividerVertical(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _image(context, 2)),
              dividerHorizontal(),
              Expanded(child: _image(context, 3))
            ],
          ),
        )
      ],
    );
  }

  Widget _buildImage5(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(child: _image(context, 0)),
              dividerVertical(),
              Expanded(child: _image(context, 1)),
            ],
          ),
        ),
        dividerHorizontal(),
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _image(context, 2)),
              dividerVertical(),
              Expanded(child: _image(context, 3)),
              dividerVertical(),
              Expanded(child: _image(context, 4))
            ],
          ),
        )
      ],
    );
  }

  Widget gridViewImage(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: min(3, media.length),
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (_, i) => _image(context, i),
        itemCount: media.length,
      ),
    );
  }
}
