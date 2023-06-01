import 'dart:async';
import 'dart:ui' as ui;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:link_preview_generator/link_preview_generator.dart';
import 'preview_link.dart';

part 'preview_link_state.dart';

class PreviewLinkBloc extends Cubit<PreviewLinkState> {
  PreviewLinkBloc(this.url) : super(PreviewLinkState.ds(url)) {
    if (state.link == null) {
      getMetadata();
    }
  }
  final String url;

  Future<void> getMetadata() async {
    try {
      // String? title;
      // String? image;
      // String? description;
      // bool isSmallImage = false;

      // emit(state.copyWith(loading: true));

      // final data = await LinkPreview.scrapeFromURL(url);
      // if (!isClosed) {
      //   isSmallImage = await _loadImageAndCheckSize(data.image);
      //   title = data.title;
      //   image = data.image;
      //   description = data.description;
      // }

      // PreviewLinkState.metaDataLink[url] = PreviewLinkData(
      //     isSmallImage: isSmallImage,
      //     image: image ?? '',
      //     title: title ?? '',
      //     description: description ?? '');
      // if (!isClosed) {
      //   emit(state.copyWith(loading: false));
      // }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<ui.Image> _getImage(String url) async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    Image image = Image.network(url);

    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((info, isSync) {
      completer.complete(info.image);
    }));
    final result = await completer.future;

    return result;
  }

  bool _isSmallImage(ui.Image image) {
    return image.width == image.height &&
        (image.width <= 512 && image.height <= 512);
  }

  // ignore: unused_element
  Future<bool> _loadImageAndCheckSize(String? imageUrl) async {
    if (!isClosed) {
      final image = await _getImage(imageUrl!);

      return _isSmallImage(image);
    }
    return false;
  }
}
