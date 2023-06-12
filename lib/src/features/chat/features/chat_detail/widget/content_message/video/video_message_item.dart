import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../../../widgets/common/indicator.dart';
import '../../../../../network/model/media/chat_media.dart';
import '../../../../../network/model/message/chat_message.dart';
import '../../../../../theme/chat_constants.dart';
import '../../../../../theme/chat_theme.dart';
import '../../../logic/chat_detail/chat_detail_cubit.dart';
import 'logic/video_player_bloc.dart';

class VideoMessageItem extends StatelessWidget {
  const VideoMessageItem({
    super.key,
    required this.isYour,
    required this.media,
    required this.message,
  });
  final bool isYour;
  final MChatMedia media;
  final MChatMessage message;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoPlayerBloc(
        media.url,
        initController: context
            .read<ChatDetailCubit>()
            .getVideoController(message.id, media.url),
      ),
      child: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
        builder: (context, videoState) {
          final controller = context.read<VideoPlayerBloc>().controller;
          double? width = media.width?.toDouble();
          double? height = media.height?.toDouble();
          if (videoState.isInitialized) {
            width = videoState.width;
            height = videoState.height;
          }
          final double maxHeight =
              media.noHasSize && videoState.isInitialized == false
                  ? ChatConstants.maxHeight
                  : ChatConstants.maxWidth * (height! / width!);
          return Container(
            constraints: BoxConstraints(maxWidth: ChatConstants.maxWidth),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: ChatConstants.borderRadius,
                  child: Container(
                    color: ChatTheme.of(context).messageBackgroundColor(isYour),
                    constraints: BoxConstraints(maxHeight: maxHeight),
                    child: VideoPlayer(controller),
                  ),
                ),
                if (!videoState.isInitialized)
                  const XIndicator()
                else
                  IconButton(
                    onPressed: () =>
                        context.read<VideoPlayerBloc>().onPlayOrPauseVideo(),
                    icon: Icon(
                      size: 48,
                      videoState.isPlaying
                          ? Icons.pause_circle
                          : Icons.play_circle,
                      color: Colors.grey[300],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
