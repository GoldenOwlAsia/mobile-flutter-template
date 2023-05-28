import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

part 'video_player_state.dart';

class VideoPlayerBloc extends Cubit<VideoPlayerState> {
  VideoPlayerBloc(String url, {VideoPlayerController? initController})
      : super(const VideoPlayerState()) {
    initialize(url, initController);
  }

  late VideoPlayerController controller;

  void initialize(String url, VideoPlayerController? initController) async {
    controller = initController ?? VideoPlayerController.network(url);
    controller.addListener(videoListener);
    if (controller.value.isInitialized == false) {
      controller.initialize();
    } else {
      videoListener();
    }
  }

  void videoListener() {
    final isInitialized = controller.value.isInitialized;
    if (isInitialized != state.isInitialized) {
      final size = controller.value.size;
      emit(state.copyWith(
        isInitialized: true,
        width: size.width,
        height: size.height,
      ));
    }
    final isPlaying = controller.value.isPlaying;
    if (state.isInitialized && isPlaying != state.isPlaying) {
      emit(state.copyWith(isPlaying: isPlaying));
    }
  }

  void onPlayOrPauseVideo() {
    if (state.isPlaying) {
      controller.pause();
      emit(state.copyWith(isPlaying: false));
    } else {
      controller.play();
      emit(state.copyWith(isPlaying: true));
    }
  }

  @override
  Future<void> close() {
    controller.removeListener(videoListener);
    return super.close();
  }
}
