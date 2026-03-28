import 'package:intl/intl.dart';
import 'date_time.ext.dart';

/// Comprehensive date utility helper class
/// Provides common date operations, formatting, and calculations
class DateHelper {
  // Private constructor to prevent instantiation
  DateHelper._();

  // MARK: - Date Range Calculations
  /// Get the start of current month (first day at 00:00:00)
  static DateTime get startOfCurrentMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  /// Get the end of current month (last day at 23:59:59.999)
  static DateTime get endOfCurrentMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 1, 0, 23, 59, 59, 999);
  }

  /// Get the start of current year (January 1st at 00:00:00)
  static DateTime get startOfCurrentYear {
    final now = DateTime.now();
    return DateTime(now.year, 1, 1);
  }

  /// Get the end of current year (December 31st at 23:59:59.999)
  static DateTime get endOfCurrentYear {
    final now = DateTime.now();
    return DateTime(now.year, 12, 31, 23, 59, 59, 999);
  }

  /// Get the start of current week (Monday at 00:00:00)
  static DateTime get startOfCurrentWeek {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    return DateTime(monday.year, monday.month, monday.day);
  }

  /// Get the end of current week (Sunday at 23:59:59.999)
  static DateTime get endOfCurrentWeek {
    final now = DateTime.now();
    final sunday = now.add(Duration(days: DateTime.daysPerWeek - now.weekday));
    return DateTime(sunday.year, sunday.month, sunday.day, 23, 59, 59, 999);
  }

  /// Get start of month for a specific date
  static DateTime startOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  /// Get end of month for a specific date
  static DateTime endOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0, 23, 59, 59, 999);
  }

  /// Get start of day (00:00:00)
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Get end of day (23:59:59.999)
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }

  // MARK: - Date Formatting
  /// Format date for chat messages with relative time
  /// Returns "HH:mm" for today, "EEE At HH:mm" for this week, etc.
  static String formatChatDate(DateTime time) {
    final today = DateTime.now();
    final isToday = time.isSameDay(today);
    final isThisWeek = today.in7Days(time);
    final isThisYear = time.year == today.year;

    if (isToday) {
      return DateFormat('HH:mm').format(time);
    } else if (isThisWeek) {
      return DateFormat('EEE At HH:mm').format(time);
    } else if (isThisYear) {
      return DateFormat('MMMM dd At HH:mm').format(time);
    } else {
      return DateFormat('MMMM dd yyyy').format(time);
    }
  }

  /// Format time for chat with different granularity
  /// More detailed formatting for different time periods
  static String formatChatTime(DateTime time) {
    final today = DateTime.now();
    final isToday = time.isSameDay(today);

    if (isToday) {
      return DateFormat('HH:mm').format(time);
    }

    final oneWeekAgo = today.subtract(const Duration(days: 7));
    final isThisWeek = time.isAfter(oneWeekAgo);
    final isThisYear = time.year == today.year;

    if (isThisWeek) {
      return DateFormat('EEEE - HH:mm').format(time);
    } else if (isThisYear) {
      return DateFormat('dd/MM - HH:mm').format(time);
    } else {
      return DateFormat('dd/MM/yyyy - HH:mm').format(time);
    }
  }

  /// Common date formatting patterns
  static String formatDate(DateTime date, {String pattern = 'yyyy-MM-dd'}) {
    return DateFormat(pattern).format(date);
  }

  /// Format date in a user-friendly way
  static String formatDateFriendly(DateTime date) {
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));

    if (date.isSameDay(today)) {
      return 'Today';
    } else if (date.isSameDay(yesterday)) {
      return 'Yesterday';
    } else if (date.isSameDay(tomorrow)) {
      return 'Tomorrow';
    } else if (date.year == today.year) {
      return DateFormat('MMM dd').format(date);
    } else {
      return DateFormat('MMM dd, yyyy').format(date);
    }
  }

  // MARK: - Date Comparison
  /// Check if two dates have the same time (down to the minute)
  static bool isSameMinute(DateTime time1, DateTime time2) {
    return time1.year == time2.year &&
        time1.month == time2.month &&
        time1.day == time2.day &&
        time1.hour == time2.hour &&
        time1.minute == time2.minute;
  }

  /// Check if date is today
  static bool isToday(DateTime date) {
    return date.isSameDay(DateTime.now());
  }

  /// Check if date is yesterday
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.isSameDay(yesterday);
  }

  /// Check if date is tomorrow
  static bool isTomorrow(DateTime date) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return date.isSameDay(tomorrow);
  }

  /// Check if date is in the current week
  static bool isThisWeek(DateTime date) {
    final now = DateTime.now();
    return date.isSameWeek(now);
  }

  /// Check if date is in the current month
  static bool isThisMonth(DateTime date) {
    final now = DateTime.now();
    return date.isSameMonth(now);
  }

  /// Check if date is in the current year
  static bool isThisYear(DateTime date) {
    return date.year == DateTime.now().year;
  }

  // MARK: - Age and Time Calculations
  /// Calculate age in years from birth date
  static int calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  /// Get time ago string (e.g., "2 minutes ago", "1 hour ago")
  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years year${years == 1 ? '' : 's'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months == 1 ? '' : 's'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }

  // MARK: - Week Calculations
  /// Get weekday index with configurable week start
  /// Returns 1-7 where 1 is either Monday or Sunday based on [startWeekWithSunday]
  static int getWeekdayIndex(
    DateTime date, {
    bool startWeekWithSunday = false,
  }) {
    if (startWeekWithSunday) {
      return date.weekday == DateTime.sunday ? 1 : date.weekday + 1;
    } else {
      return date.weekday;
    }
  }

  /// Get the last day of the week containing the given date
  /// Handles month boundaries correctly
  static DateTime getLastDayOfWeek(
    DateTime date, {
    bool startWeekWithSunday = false,
  }) {
    final daysInMonth = date.daysInMonth;
    final dayOfWeek = getWeekdayIndex(
      date,
      startWeekWithSunday: startWeekWithSunday,
    );
    final remainingDaysInWeek = DateTime.daysPerWeek - dayOfWeek;

    // Check if week extends beyond month
    if (date.day + remainingDaysInWeek > daysInMonth) {
      return DateTime(date.year, date.month, daysInMonth);
    } else {
      return date.addDays(remainingDaysInWeek);
    }
  }

  /// Find a specific day of the week in the same month as the given date
  /// Returns the date of that weekday in the same week
  static DateTime findWeekdayInSameWeek(
    DateTime date,
    int targetWeekday, {
    bool startWeekWithSunday = false,
  }) {
    final dateWithoutTime = date.removeTime();
    final currentWeekday = getWeekdayIndex(
      date,
      startWeekWithSunday: startWeekWithSunday,
    );
    final daysDifference = targetWeekday - currentWeekday;

    return dateWithoutTime.addDays(daysDifference);
  }

  /// Get all dates in the same week as the given date
  static List<DateTime> getDatesInWeek(
    DateTime date, {
    bool startWeekWithSunday = false,
  }) {
    final weekStart = startWeekWithSunday
        ? date.subtract(Duration(days: (date.weekday % 7)))
        : date.subtract(Duration(days: date.weekday - 1));

    return List.generate(7, (index) => weekStart.addDays(index));
  }

  // MARK: - Calendar Calculations
  /// Get number of days in each month for a given year
  /// Returns list of 12 integers representing days in each month
  static List<int> getDaysPerMonth(int year) => <int>[
    31, // January
    isLeapYear(year) ? 29 : 28, // February
    31, // March
    30, // April
    31, // May
    30, // June
    31, // July
    31, // August
    30, // September
    31, // October
    30, // November
    31, // December
  ];

  /// Check if a year is a leap year
  /// Uses efficient bitwise calculation for performance
  static bool isLeapYear(int year) {
    return (year & 3) == 0 && ((year % 25) != 0 || (year & 15) == 0);
  }

  /// Get number of days in a specific month
  static int getDaysInMonth(int year, int month) {
    if (month < 1 || month > 12) {
      throw ArgumentError('Month must be between 1 and 12');
    }
    return getDaysPerMonth(year)[month - 1];
  }

  /// Get all dates in a specific month
  static List<DateTime> getDatesInMonth(int year, int month) {
    final daysInMonth = getDaysInMonth(year, month);
    return List.generate(
      daysInMonth,
      (index) => DateTime(year, month, index + 1),
    );
  }

  /// Get the quarter of the year (1-4) for a given date
  static int getQuarter(DateTime date) {
    return ((date.month - 1) ~/ 3) + 1;
  }

  /// Get the start date of a quarter
  static DateTime getQuarterStart(int year, int quarter) {
    if (quarter < 1 || quarter > 4) {
      throw ArgumentError('Quarter must be between 1 and 4');
    }
    final month = (quarter - 1) * 3 + 1;
    return DateTime(year, month, 1);
  }

  /// Get the end date of a quarter
  static DateTime getQuarterEnd(int year, int quarter) {
    if (quarter < 1 || quarter > 4) {
      throw ArgumentError('Quarter must be between 1 and 4');
    }
    final month = quarter * 3;
    final daysInMonth = getDaysInMonth(year, month);
    return DateTime(year, month, daysInMonth, 23, 59, 59, 999);
  }

  // MARK: - Business Date Calculations
  /// Check if a date is a weekend (Saturday or Sunday)
  static bool isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  /// Check if a date is a weekday (Monday to Friday)
  static bool isWeekday(DateTime date) {
    return !isWeekend(date);
  }

  /// Get the next business day (skips weekends)
  static DateTime getNextBusinessDay(DateTime date) {
    DateTime nextDay = date.add(const Duration(days: 1));
    while (isWeekend(nextDay)) {
      nextDay = nextDay.add(const Duration(days: 1));
    }
    return nextDay;
  }

  /// Get the previous business day (skips weekends)
  static DateTime getPreviousBusinessDay(DateTime date) {
    DateTime previousDay = date.subtract(const Duration(days: 1));
    while (isWeekend(previousDay)) {
      previousDay = previousDay.subtract(const Duration(days: 1));
    }
    return previousDay;
  }

  /// Count business days between two dates (excludes weekends)
  static int countBusinessDays(DateTime startDate, DateTime endDate) {
    if (startDate.isAfter(endDate)) {
      return -countBusinessDays(endDate, startDate);
    }

    int businessDays = 0;
    DateTime currentDate = startDate;

    while (currentDate.isBefore(endDate) || currentDate.isSameDay(endDate)) {
      if (isWeekday(currentDate)) {
        businessDays++;
      }
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return businessDays;
  }

  // MARK: - Calendar Layout Utilities
  /// Calculate spaces needed before first valid date in calendar layout
  /// Used for calendar widgets when certain weekdays are hidden
  static int getSpacesBeforeFirstValidDate(
    List<int> hiddenWeekdays,
    int firstValidWeekday, {
    bool startWeekWithSunday = false,
  }) {
    final weekdayOrder = startWeekWithSunday
        ? [7, 1, 2, 3, 4, 5, 6] // Sunday first
        : [1, 2, 3, 4, 5, 6, 7]; // Monday first

    final visibleWeekdays = weekdayOrder
        .where((weekday) => !hiddenWeekdays.contains(weekday))
        .toList();

    return visibleWeekdays.indexOf(firstValidWeekday);
  }

  /// Get visible weekdays for calendar layout
  static List<int> getVisibleWeekdays(
    List<int> hiddenWeekdays, {
    bool startWeekWithSunday = false,
  }) {
    final weekdayOrder = startWeekWithSunday
        ? [7, 1, 2, 3, 4, 5, 6] // Sunday first
        : [1, 2, 3, 4, 5, 6, 7]; // Monday first

    return weekdayOrder
        .where((weekday) => !hiddenWeekdays.contains(weekday))
        .toList();
  }

  /// Get weekday names in order
  static List<String> getWeekdayNames({
    bool startWeekWithSunday = false,
    bool abbreviated = false,
  }) {
    final fullNames = startWeekWithSunday
        ? [
            'Sunday',
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday',
          ]
        : [
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday',
            'Sunday',
          ];

    if (abbreviated) {
      return fullNames.map((name) => name.substring(0, 3)).toList();
    }

    return fullNames;
  }

  /// Get month names
  static List<String> getMonthNames({bool abbreviated = false}) {
    final fullNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    if (abbreviated) {
      return fullNames.map((name) => name.substring(0, 3)).toList();
    }

    return fullNames;
  }

  // MARK: - Utility Methods
  /// Parse date string with multiple format attempts
  static DateTime? tryParseDate(String dateString) {
    final formats = [
      'yyyy-MM-dd',
      'dd/MM/yyyy',
      'MM/dd/yyyy',
      'yyyy-MM-dd HH:mm:ss',
      'dd/MM/yyyy HH:mm:ss',
      'MM/dd/yyyy HH:mm:ss',
    ];

    for (final format in formats) {
      try {
        return DateFormat(format).parse(dateString);
      } catch (e) {
        // Continue to next format
      }
    }

    // Try built-in parser as fallback
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Get date range between two dates
  static List<DateTime> getDateRange(DateTime startDate, DateTime endDate) {
    if (startDate.isAfter(endDate)) {
      throw ArgumentError('Start date must be before or equal to end date');
    }

    final dates = <DateTime>[];
    DateTime currentDate = startDate;

    while (currentDate.isBefore(endDate) || currentDate.isSameDay(endDate)) {
      dates.add(currentDate);
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return dates;
  }
}
