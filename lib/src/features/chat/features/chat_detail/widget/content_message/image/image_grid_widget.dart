import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/widgets/image/image_network.dart';
import '../../../../../../../network/chat/model/media/chat_media.dart';
import '../../../../../../../router/coordinator.dart';
import '../../../../../theme/chat_constants.dart';

class ImageGirdWidget extends StatelessWidget {
  const ImageGirdWidget(this.media, {super.key});

  final List<MChatMedia> media;

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (media.length) {
      case 1:
        return _singleImage(media.first);
      case 2:
        child = SizedBox(
          height: 200,
          child: _buildImage2(),
        );
        break;
      case 3:
        child = SizedBox(
          height: 300,
          child: _buildImage3(),
        );
        break;
      case 4:
        child = SizedBox(
          height: 350,
          child: _buildImage4(),
        );
        break;
      case 5:
        child = SizedBox(
          height: 300,
          child: _buildImage5(),
        );
        break;
      default:
        child = gridViewImage();
        break;
    }
    return ClipRRect(
      borderRadius: ChatConstants.borderRadius,
      child: child,
    );
  }

  Widget _singleImage(MChatMedia photo) {
    double? width;
    double? height;
    if (photo.noHasSize == false) {
      width = ChatConstants.maxWidth;
      height = ChatConstants.maxWidth * (photo.height! / photo.width!);
    }
    return GestureDetector(
      onTap: () {
        AppCoordinator.showPhotoView(media.map((e) => e.url).toList());
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

  Widget _image(int index) {
    return GestureDetector(
      onTap: () {
        AppCoordinator.showPhotoView(media.map((e) => e.url).toList(),
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

  Widget _buildImage2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: _image(0),
        ),
        dividerVertical(),
        Expanded(child: _image(1))
      ],
    );
  }

  Widget _buildImage3() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: _image(0)),
        dividerVertical(),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _image(1)),
              dividerHorizontal(),
              Expanded(child: _image(2))
            ],
          ),
        )
      ],
    );
  }

  Widget _buildImage4() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _image(0)),
              dividerHorizontal(),
              Expanded(child: _image(1)),
            ],
          ),
        ),
        dividerVertical(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _image(2)),
              dividerHorizontal(),
              Expanded(child: _image(3))
            ],
          ),
        )
      ],
    );
  }

  Widget _buildImage5() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(child: _image(0)),
              dividerVertical(),
              Expanded(child: _image(1)),
            ],
          ),
        ),
        dividerHorizontal(),
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _image(2)),
              dividerVertical(),
              Expanded(child: _image(3)),
              dividerVertical(),
              Expanded(child: _image(4))
            ],
          ),
        )
      ],
    );
  }

  Widget gridViewImage() {
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
        itemBuilder: (_, i) => _image(i),
        itemCount: media.length,
      ),
    );
  }
}
