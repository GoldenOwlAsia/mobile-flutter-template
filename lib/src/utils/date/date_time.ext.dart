import 'package:flutter/material.dart';

/// DateTime extensions for common date operations
/// Provides convenient methods for date manipulation and comparison
extension DateTimeExtensions on DateTime {
  // MARK: - Date Properties

  /// Get the number of days in the current month
  int get daysInMonth {
    return DateTime(year, month + 1, 0).day;
  }

  /// Get the next day
  DateTime get nextDay => add(const Duration(days: 1));

  /// Get the previous day
  DateTime get previousDay => subtract(const Duration(days: 1));

  /// Get the start of the day (00:00:00)
  DateTime get startOfDay => DateTime(year, month, day);

  /// Get the end of the day (23:59:59.999)
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  /// Get the start of the month
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// Get the end of the month
  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59, 999);

  /// Get the start of the year
  DateTime get startOfYear => DateTime(year, 1, 1);

  /// Get the end of the year
  DateTime get endOfYear => DateTime(year, 12, 31, 23, 59, 59, 999);

  // MARK: - Date Comparisons

  /// Check if this date is the same day as another date
  bool isSameDay(DateTime other) => DateUtils.isSameDay(this, other);

  /// Check if this date is the same day or after another date
  bool isSameDayOrAfter(DateTime other) => isAfter(other) || isSameDay(other);

  /// Check if this date is the same day or before another date
  bool isSameDayOrBefore(DateTime other) => isBefore(other) || isSameDay(other);

  /// Check if this date is in the same month as another date
  bool isSameMonth(DateTime other) =>
      year == other.year && month == other.month;

  /// Check if this date is in the same year as another date
  bool isSameYear(DateTime other) => year == other.year;

  /// Check if this date is in the same week as another date
  /// Week starts on Monday by default
  bool isSameWeek(DateTime other, {bool startWeekWithSunday = false}) {
    final thisWeekStart = _getWeekStart(startWeekWithSunday);
    final otherWeekStart = other._getWeekStart(startWeekWithSunday);
    return thisWeekStart.isSameDay(otherWeekStart);
  }

  /// Check if another date is within 7 days of this date
  bool isWithin7Days(DateTime other) {
    final daysDifference = difference(other).inDays.abs();
    return daysDifference < 7;
  }

  /// Check if this date is today
  bool get isToday => isSameDay(DateTime.now());

  /// Check if this date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return isSameDay(yesterday);
  }

  /// Check if this date is tomorrow
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return isSameDay(tomorrow);
  }

  /// Check if this date is in the past
  bool get isPast => isBefore(DateTime.now());

  /// Check if this date is in the future
  bool get isFuture => isAfter(DateTime.now());

  // MARK: - Date Manipulation

  /// Remove time component, keeping only the date
  DateTime removeTime() => DateTime(year, month, day);

  /// Add days to this date while preserving time
  DateTime addDays(int days) => add(Duration(days: days));

  /// Subtract days from this date while preserving time
  DateTime subtractDays(int days) => subtract(Duration(days: days));

  /// Add days to this date, removing time component
  DateTime addDaysWithoutTime(int days) {
    return DateTime(year, month, day + days);
  }

  /// Add months to this date
  DateTime addMonths(int months) {
    final newMonth = month + months;
    final newYear = year + (newMonth - 1) ~/ 12;
    final adjustedMonth = ((newMonth - 1) % 12) + 1;

    // Handle day overflow (e.g., Jan 31 + 1 month = Feb 28/29)
    final maxDayInNewMonth = DateTime(newYear, adjustedMonth + 1, 0).day;
    final adjustedDay = day > maxDayInNewMonth ? maxDayInNewMonth : day;

    return DateTime(newYear, adjustedMonth, adjustedDay, hour, minute, second,
        millisecond, microsecond);
  }

  /// Add years to this date
  DateTime addYears(int years) {
    final newYear = year + years;

    // Handle leap year edge case (Feb 29 + 1 year)
    if (month == 2 && day == 29 && !_isLeapYear(newYear)) {
      return DateTime(
          newYear, month, 28, hour, minute, second, millisecond, microsecond);
    }

    return DateTime(
        newYear, month, day, hour, minute, second, millisecond, microsecond);
  }

  /// Get the first day of the week containing this date
  DateTime getWeekStart({bool startWeekWithSunday = false}) {
    return _getWeekStart(startWeekWithSunday);
  }

  /// Get the last day of the week containing this date
  DateTime getWeekEnd({bool startWeekWithSunday = false}) {
    final weekStart = _getWeekStart(startWeekWithSunday);
    return weekStart.add(const Duration(
        days: 6, hours: 23, minutes: 59, seconds: 59, milliseconds: 999));
  }

  // MARK: - Utility Methods

  /// Get age in years from this date to now
  int get ageInYears {
    final today = DateTime.now();
    int age = today.year - year;

    if (today.month < month || (today.month == month && today.day < day)) {
      age--;
    }

    return age;
  }

  /// Get the day of year (1-366)
  int get dayOfYear {
    final startOfYear = DateTime(year, 1, 1);
    return difference(startOfYear).inDays + 1;
  }

  /// Get the week number in the year (1-53)
  int get weekOfYear {
    final startOfYear = DateTime(year, 1, 1);
    final firstMonday =
        startOfYear.add(Duration(days: (8 - startOfYear.weekday) % 7));

    if (isBefore(firstMonday)) {
      // This date is in week 1 or belongs to previous year's last week
      return 1;
    }

    final weeksSinceFirstMonday = difference(firstMonday).inDays ~/ 7;
    return weeksSinceFirstMonday + 2; // +1 for week 1, +1 for 0-based index
  }

  /// Check if this year is a leap year
  bool get isLeapYear => _isLeapYear(year);

  // MARK: - Private Helper Methods

  DateTime _getWeekStart(bool startWeekWithSunday) {
    if (startWeekWithSunday) {
      final daysFromSunday = weekday % 7;
      return subtract(Duration(days: daysFromSunday));
    } else {
      final daysFromMonday = weekday - 1;
      return subtract(Duration(days: daysFromMonday));
    }
  }

  bool _isLeapYear(int year) {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  }

  /// Check if within 7 days (alias for isWithin7Days)
  bool in7Days(DateTime other) => isWithin7Days(other);
}
