import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../../../../../../widgets/common/indicator.dart';
import '../../../../../../utils/date/date_helper.dart';
import '../../../../network/model/media/chat_media.dart';
import '../../../../theme/chat_colors.dart';
import '../../../../theme/chat_theme.dart';

class AudioMessageItem extends StatefulWidget {
  const AudioMessageItem(this.media, {Key? key, required this.isYour})
      : super(key: key);
  final MChatMedia media;
  final bool isYour;
  @override
  State<AudioMessageItem> createState() => _AudioMessageItemState();
}

class _AudioMessageItemState extends State<AudioMessageItem> {
  AudioPlayer? audioPlayer;
  bool isPlaying = false;
  bool isLoading = true;
  bool isInit = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    duration = Duration(seconds: widget.media.duration ?? 0);
    super.initState();
  }

  Future setAudio() async {
    setState(() {
      isInit = true;
    });
    audioPlayer = AudioPlayer(playerId: UniqueKey().toString());
    await audioPlayer?.setReleaseMode(ReleaseMode.stop);
    await audioPlayer?.setSourceUrl(widget.media.url);

    audioPlayer?.onDurationChanged.listen((event) {
      if (mounted) {
        setState(() {
          duration = event;
        });
      }
    });

    audioPlayer?.onPositionChanged.listen((event) {
      if (mounted) {
        setState(() {
          position = event;
        });
      }
    });

    audioPlayer?.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          isPlaying = false;
        });
      }
    });
    audioPlayer?.resume();
    setState(() {
      isPlaying = true;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _disposeAudio(audioPlayer);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        ChatTheme.of(context).messageBackgroundColor(widget.isYour);
    final textColor = ChatTheme.of(context).messageTextColor(widget.isYour);
    final sliderMax = duration.inSeconds.toDouble();
    final sliderValue = min(sliderMax, position.inSeconds.toDouble());
    return Container(
      padding: const EdgeInsets.only(left: 3.0, right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPlayButton(backgroundColor),
          Expanded(
            child: Slider(
              min: 0,
              max: sliderMax,
              value: sliderValue,
              activeColor: widget.isYour ? Colors.white : Colors.black,
              inactiveColor:
                  widget.isYour ? ChatColors.grey4 : ChatColors.grey4,
              thumbColor: widget.isYour ? ChatColors.grey4 : ChatColors.grey4,
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer?.seek(position);
                await audioPlayer?.resume();
              },
            ),
          ),
          Container(
            width: 46,
            alignment: Alignment.centerRight,
            child: Text(
              DateHelper.getTimeAudio(duration - position),
              style: TextStyle(
                fontSize: 14,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayButton(Color backgroundColor) {
    if (isLoading && isInit) {
      return const SizedBox(
        width: 40,
        height: 40,
        child: Center(child: XIndicator(radius: 12)),
      );
    }
    return IconButton(
      onPressed: () async {
        if (isInit == false) {
          setAudio();
        } else {
          if (isPlaying) {
            await audioPlayer?.pause();
          } else {
            await audioPlayer?.resume();
          }
          setState(() {
            isPlaying = !isPlaying;
          });
        }
      },
      icon: Container(
        height: 32,
        width: 32,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
          color: backgroundColor,
        ),
      ),
    );
  }
}

Future _disposeAudio(AudioPlayer? audioPlayer) async {
  await audioPlayer?.stop();
  await audioPlayer?.dispose();
}
