/// Duration extensions for common duration operations
/// Provides convenient methods for duration formatting and manipulation
extension DurationExtensions on Duration {
  // MARK: - Duration Formatting

  /// Format duration in MM:SS format (commonly used for media/timers)
  /// Example: Duration(minutes: 2, seconds: 30) -> "02:30"
  /// Example: Duration(hours: 1, minutes: 2, seconds: 30) -> "62:30"
  String get toMMSS {
    final totalMinutes = inMinutes.toString().padLeft(2, '0');
    final seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$totalMinutes:$seconds';
  }

  /// Format duration in digital clock format (adaptive HH:MM:SS or MM:SS)
  /// Example: Duration(hours: 1, minutes: 2, seconds: 30) -> "01:02:30"
  /// Example: Duration(minutes: 2, seconds: 30) -> "02:30"
  String get toDigitalClock {
    final hours = inHours;
    final minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = inSeconds.remainder(60).toString().padLeft(2, '0');

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }

  /// Check if duration is zero
  bool get isZero => inMicroseconds == 0;

  /// Round duration to nearest minute
  Duration roundToMinute() {
    final totalMinutes = (inSeconds / 60).round();
    return Duration(minutes: totalMinutes);
  }

  /// Round duration to nearest hour
  Duration roundToHour() {
    final totalHours = (inMinutes / 60).round();
    return Duration(hours: totalHours);
  }

  /// Round duration to nearest day
  Duration roundToDay() {
    final totalDays = (inHours / 24).round();
    return Duration(days: totalDays);
  }

  /// Clamp duration between min and max values
  Duration clamp(Duration min, Duration max) {
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }

  /// Parse duration from string formats like "2h 30m", "1d 5h", "45s"
  static Duration? tryParse(String durationString) {
    try {
      final cleanString = durationString.toLowerCase().trim();

      // Handle simple time formats like "02:30" or "1:30:45"
      if (cleanString.contains(':')) {
        final parts = cleanString.split(':');
        if (parts.length == 2) {
          // MM:SS format
          final minutes = int.parse(parts[0]);
          final seconds = int.parse(parts[1]);
          return Duration(minutes: minutes, seconds: seconds);
        } else if (parts.length == 3) {
          // HH:MM:SS format
          final hours = int.parse(parts[0]);
          final minutes = int.parse(parts[1]);
          final seconds = int.parse(parts[2]);
          return Duration(hours: hours, minutes: minutes, seconds: seconds);
        }
      }

      // Handle human-readable formats like "2h 30m", "1d 5h", "45s"
      var totalMicroseconds = 0;

      // Days
      final daysMatch = RegExp(r'(\d+)d').firstMatch(cleanString);
      if (daysMatch != null) {
        totalMicroseconds +=
            Duration(days: int.parse(daysMatch.group(1)!)).inMicroseconds;
      }

      // Hours
      final hoursMatch = RegExp(r'(\d+)h').firstMatch(cleanString);
      if (hoursMatch != null) {
        totalMicroseconds +=
            Duration(hours: int.parse(hoursMatch.group(1)!)).inMicroseconds;
      }

      // Minutes
      final minutesMatch = RegExp(r'(\d+)m').firstMatch(cleanString);
      if (minutesMatch != null) {
        totalMicroseconds +=
            Duration(minutes: int.parse(minutesMatch.group(1)!)).inMicroseconds;
      }

      // Seconds
      final secondsMatch = RegExp(r'(\d+)s').firstMatch(cleanString);
      if (secondsMatch != null) {
        totalMicroseconds +=
            Duration(seconds: int.parse(secondsMatch.group(1)!)).inMicroseconds;
      }

      return totalMicroseconds > 0
          ? Duration(microseconds: totalMicroseconds)
          : null;
    } catch (e) {
      return null;
    }
  }
}
