// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'video_player_bloc.dart';

class VideoPlayerState extends Equatable {
  const VideoPlayerState({
    this.isPlaying = false,
    this.isInitialized = false,
    this.width = 0,
    this.height = 0,
  });
  final bool isPlaying;
  final bool isInitialized;
  final double width;
  final double height;

  @override
  List<Object?> get props => [
        isPlaying,
        isInitialized,
        width,
        height,
      ];

  VideoPlayerState copyWith({
    bool? isPlaying,
    bool? isInitialized,
    double? width,
    double? height,
  }) {
    return VideoPlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      isInitialized: isInitialized ?? this.isInitialized,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}
