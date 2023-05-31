class RecordAudioState {
  const RecordAudioState({
    this.pathAudio = '',
    this.durationAudio = Duration.zero,
    this.isRecording = false,
  });
  final String pathAudio;
  final bool isRecording;
  final Duration durationAudio;

  RecordAudioState copyWith({
    String? pathAudio,
    Duration? durationAudio,
    bool? isRecording,
  }) {
    return RecordAudioState(
      pathAudio: pathAudio ?? this.pathAudio,
      durationAudio: durationAudio ?? this.durationAudio,
      isRecording: isRecording ?? this.isRecording,
    );
  }
}
