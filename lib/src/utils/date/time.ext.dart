import 'package:flutter/material.dart';

/// TimeOfDay extensions for common time operations
/// Provides convenient methods for time formatting and manipulation
extension TimeOfDayExtensions on TimeOfDay {
  // MARK: - Time Formatting

  /// Get formatted time string in HH:mm format (24-hour)
  String get formattedTime =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  /// Get formatted time string in 12-hour format with AM/PM
  String get formatted12Hour {
    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    return '${hour12.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }

  /// Get formatted time string in 12-hour format without leading zero
  String get formatted12HourShort {
    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    return '$hour12:${minute.toString().padLeft(2, '0')} $period';
  }

  /// Get time in minutes since midnight
  int get totalMinutes => hour * 60 + minute;

  /// Get time in seconds since midnight
  int get totalSeconds => totalMinutes * 60;

  // MARK: - Time Comparisons

  /// Check if this time is before another time
  bool isBefore(TimeOfDay other) => totalMinutes < other.totalMinutes;

  /// Check if this time is after another time
  bool isAfter(TimeOfDay other) => totalMinutes > other.totalMinutes;

  /// Check if this time is the same as another time
  bool isSameTime(TimeOfDay other) => totalMinutes == other.totalMinutes;

  /// Check if this time is between two other times (inclusive)
  bool isBetween(TimeOfDay start, TimeOfDay end) {
    final thisMinutes = totalMinutes;
    final startMinutes = start.totalMinutes;
    final endMinutes = end.totalMinutes;

    if (startMinutes <= endMinutes) {
      // Normal case: start is before end (e.g., 09:00 to 17:00)
      return thisMinutes >= startMinutes && thisMinutes <= endMinutes;
    } else {
      // Overnight case: start is after end (e.g., 22:00 to 06:00)
      return thisMinutes >= startMinutes || thisMinutes <= endMinutes;
    }
  }

  // MARK: - Time Manipulation

  /// Add minutes to this time
  TimeOfDay addMinutes(int minutes) {
    final totalMinutesNew = (totalMinutes + minutes) % (24 * 60);
    final newHour = totalMinutesNew ~/ 60;
    final newMinute = totalMinutesNew % 60;
    return TimeOfDay(hour: newHour, minute: newMinute);
  }

  /// Subtract minutes from this time
  TimeOfDay subtractMinutes(int minutes) {
    final totalMinutesNew = (totalMinutes - minutes + 24 * 60) % (24 * 60);
    final newHour = totalMinutesNew ~/ 60;
    final newMinute = totalMinutesNew % 60;
    return TimeOfDay(hour: newHour, minute: newMinute);
  }

  /// Add hours to this time
  TimeOfDay addHours(int hours) => addMinutes(hours * 60);

  /// Subtract hours from this time
  TimeOfDay subtractHours(int hours) => subtractMinutes(hours * 60);

  // MARK: - Time Utilities

  /// Get duration between this time and another time
  /// Returns positive duration if other time is after this time
  Duration durationUntil(TimeOfDay other) {
    final thisMinutes = totalMinutes;
    final otherMinutes = other.totalMinutes;

    int minutesDifference;
    if (otherMinutes >= thisMinutes) {
      minutesDifference = otherMinutes - thisMinutes;
    } else {
      // Next day
      minutesDifference = (24 * 60) - thisMinutes + otherMinutes;
    }

    return Duration(minutes: minutesDifference);
  }

  /// Get duration since another time
  /// Returns positive duration if this time is after the other time
  Duration durationSince(TimeOfDay other) {
    return other.durationUntil(this);
  }

  /// Convert to DateTime using the provided date
  DateTime toDateTime(DateTime date) {
    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  /// Convert to DateTime using today's date
  DateTime get toDateTimeToday {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  /// Check if this is AM time
  bool get isAM => hour < 12;

  /// Check if this is PM time
  bool get isPM => hour >= 12;

  /// Check if this is midnight (00:00)
  bool get isMidnight => hour == 0 && minute == 0;

  /// Check if this is noon (12:00)
  bool get isNoon => hour == 12 && minute == 0;

  /// Get the period (AM/PM) as string
  String get period => hour >= 12 ? 'PM' : 'AM';

  /// Round to nearest quarter hour (00, 15, 30, 45)
  TimeOfDay roundToQuarterHour() {
    final quarterMinute = ((minute + 7) ~/ 15) * 15;
    if (quarterMinute == 60) {
      return TimeOfDay(hour: (hour + 1) % 24, minute: 0);
    }
    return TimeOfDay(hour: hour, minute: quarterMinute);
  }

  /// Round to nearest half hour (00, 30)
  TimeOfDay roundToHalfHour() {
    final halfMinute = ((minute + 15) ~/ 30) * 30;
    if (halfMinute == 60) {
      return TimeOfDay(hour: (hour + 1) % 24, minute: 0);
    }
    return TimeOfDay(hour: hour, minute: halfMinute);
  }

  /// Round to nearest hour
  TimeOfDay roundToHour() {
    if (minute >= 30) {
      return TimeOfDay(hour: (hour + 1) % 24, minute: 0);
    }
    return TimeOfDay(hour: hour, minute: 0);
  }

  // MARK: - Static Utilities

  /// Create TimeOfDay from total minutes since midnight
  static TimeOfDay fromMinutes(int totalMinutes) {
    final adjustedMinutes = totalMinutes % (24 * 60);
    final hour = adjustedMinutes ~/ 60;
    final minute = adjustedMinutes % 60;
    return TimeOfDay(hour: hour, minute: minute);
  }

  /// Create TimeOfDay from total seconds since midnight
  static TimeOfDay fromSeconds(int totalSeconds) {
    return fromMinutes(totalSeconds ~/ 60);
  }

  /// Parse time string in HH:mm format
  static TimeOfDay? tryParse(String timeString) {
    try {
      final parts = timeString.split(':');
      if (parts.length != 2) return null;

      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
        return null;
      }

      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      return null;
    }
  }

  // MARK: - Legacy Method (backward compatibility)

  /// Get formatted time string (alias for formattedTime)
  String get getString => formattedTime;
}
