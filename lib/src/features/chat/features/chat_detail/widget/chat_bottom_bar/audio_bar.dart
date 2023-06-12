import 'dart:math';

import 'package:audio_wave/audio_wave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../utils/date/date_helper.dart';
import '../../../../theme/chat_colors.dart';
import '../../../../theme/chat_theme.dart';
import '../../logic/send_message/record_audio_state.dart';
import '../../logic/send_message/send_message_cubit.dart';

class AudioBar extends StatelessWidget {
  const AudioBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child:
            BlocSelector<SendMessageCubit, SendMessageState, RecordAudioState>(
          selector: (state) => state.recordAudio,
          builder: (context, state) {
            final textColor = state.isRecording ? Colors.white : Colors.black;
            final color = state.isRecording
                ? ChatTheme.of(context).primaryColor
                : ChatColors.grey4;
            const radius = Radius.circular(8);
            const size = 56.0;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        height: size,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                width: size,
                                height: size,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: const BorderRadius.horizontal(
                                    left: radius,
                                  ),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: _audioWave(
                                          state.isRecording,
                                          state.durationAudio,
                                          textColor,
                                        ),
                                      ),
                                    ),
                                    _textTimeRecord(
                                        state.durationAudio, textColor),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 2),
                            Container(
                              width: size,
                              height: size,
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: const BorderRadius.horizontal(
                                      right: radius)),
                              child: IconButton(
                                onPressed: () {
                                  if (state.isRecording) {
                                    context
                                        .read<SendMessageCubit>()
                                        .pauseRecorder();
                                  } else {
                                    context
                                        .read<SendMessageCubit>()
                                        .startRecorder();
                                  }
                                },
                                icon: Icon(
                                  state.isRecording ? Icons.pause : Icons.mic,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      // remove button
                      IconButton(
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: Colors.red,
                          size: 28,
                        ),
                        onPressed: () {
                          context.read<SendMessageCubit>().cancelRecord();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.restart_alt_outlined,
                          color: ChatTheme.of(context).primaryColor,
                          size: 28,
                        ),
                        onPressed: () {
                          context.read<SendMessageCubit>().resetRecord();
                        },
                      ),
                      const Spacer(),
                      IconButton(
                          icon: const Icon(Icons.send_rounded),
                          iconSize: 26,
                          onPressed: () {
                            context
                                .read<SendMessageCubit>()
                                .uploadAudioAndSendMessage();
                          })
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }

  Widget _textTimeRecord(Duration duration, Color color) {
    return Text(DateHelper.getTimeAudio(duration),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: color,
        ));
  }

  Widget _audioWave(bool animation, Duration duration, Color color) {
    const maxWave = 40;
    final inSeconds = duration.inSeconds;
    final count = max(0, min(inSeconds, maxWave));
    final offset = inSeconds <= maxWave ? 0 : inSeconds % maxWave;

    return AudioWave(
      animation: false,
      height: 32,
      width: count * 5,
      spacing: 2.5,
      bars: [
        for (int i = 0; i < count; i++)
          AudioWaveBar(
              heightFactor: _heightFactorAt(i + offset) / 10, color: color),
      ],
    );
  }

  double _heightFactorAt(int i) {
    return _heightFactor[i % _heightFactor.length];
  }
}

final List<double> _heightFactor = [
  1,
  2,
  5,
  8,
  9,
  6,
  5,
  4,
  3,
  7,
  6,
  5,
  5,
  4,
  3,
  8,
  4,
  3,
  5
];
