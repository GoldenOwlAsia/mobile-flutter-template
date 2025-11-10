import 'package:myapp/src/utils/logger.dart';

/// Utility class containing common helper methods for data manipulation,
/// string operations, and list processing
class Utils {
  // Private constructor to prevent instantiation
  Utils._();

  // MARK: - Data Conversion

  /// Convert dynamic data to a typed list using a transformation function
  /// Returns empty list if input is null or not a List
  ///
  /// Example:
  /// ```dart
  /// final numbers = Utils.listOf(jsonData, (e) => int.parse(e.toString()));
  /// ```
  static List<T> listOf<T>(
      dynamic data, T Function(dynamic element) toElement) {
    if (data != null && data is List) {
      try {
        return data.map(toElement).toList();
      } catch (e) {
        xLog.w('Error converting list: $e');
        return [];
      }
    }
    return [];
  }

  // MARK: - String Utilities

  /// Compare two strings ignoring case and whitespace
  /// Returns true if both strings are equal after trimming and lowercasing
  /// Handles null values gracefully
  static bool isStringEqual(String? val1, String? val2) {
    return val1?.trim().toLowerCase() == val2?.trim().toLowerCase();
  }

  /// Check if a name matches a search query (case-insensitive)
  /// Returns true if the name contains the query string
  static bool isMatchSearch(String name, String query) {
    if (query.isEmpty) return true;

    final normalizedName = name.toLowerCase();
    final normalizedQuery = query.toLowerCase();
    return normalizedName.contains(normalizedQuery);
  }

  /// Check if any name in a list matches the search query
  /// Returns true if at least one name matches the query
  static bool isMatchAllSearch(List<String> names, String query) {
    if (query.isEmpty) return true;
    if (names.isEmpty) return false;

    return names.any((name) => isMatchSearch(name, query));
  }

  /// Combine first and last name into a full name
  /// Handles null values and empty strings gracefully
  ///
  /// Parameters:
  /// - [first]: First name (nullable)
  /// - [last]: Last name (nullable)
  /// - [separator]: String to separate names (default: space)
  static String fullnameOf(
    String? first,
    String? last, {
    String separator = ' ',
  }) {
    final firstName = first?.trim();
    final lastName = last?.trim();

    final hasFirst = firstName?.isNotEmpty == true;
    final hasLast = lastName?.isNotEmpty == true;

    if (!hasFirst && !hasLast) return '';
    if (!hasFirst) return lastName!;
    if (!hasLast) return firstName!;

    return '$firstName$separator$lastName';
  }

  // MARK: - List Utilities

  /// Toggle an item in a list (add if not present, remove if present)
  /// Returns a new list without modifying the original
  ///
  /// Example:
  /// ```dart
  /// final newList = Utils.toggleList([1, 2, 3], 2); // [1, 3]
  /// final newList2 = Utils.toggleList([1, 3], 2);   // [1, 3, 2]
  /// ```
  static List<T> toggleList<T>(List<T> list, T value) {
    final newList = List<T>.from(list);

    if (newList.contains(value)) {
      newList.remove(value);
    } else {
      newList.add(value);
    }

    return newList;
  }

  /// Split a list into chunks of specified size
  /// Returns a list of sublists, each with at most [chunkSize] elements
  /// The last chunk may contain fewer elements if the list doesn't divide evenly
  ///
  /// Parameters:
  /// - [list]: The list to split
  /// - [chunkSize]: Maximum size of each chunk (minimum 1)
  ///
  /// Example:
  /// ```dart
  /// Utils.chunk([1, 2, 3, 4, 5], 2) // [[1, 2], [3, 4], [5]]
  /// ```
  static List<List<T>> chunk<T>(List<T> list, int chunkSize) {
    if (list.isEmpty) return [];

    final size = chunkSize < 1 ? 1 : chunkSize;

    if (size >= list.length) return [list];

    final result = <List<T>>[];

    for (int i = 0; i < list.length; i += size) {
      final end = (i + size < list.length) ? i + size : list.length;
      result.add(list.sublist(i, end));
    }

    return result;
  }
}

// MARK: - Global Utility Functions

/// Check if an object is null or empty
/// Works with strings (checks if trimmed string is empty),
/// iterables (checks if empty), and maps (checks if empty)
///
/// Returns true if:
/// - Object is null
/// - String is empty or only whitespace
/// - Iterable/List is empty
/// - Map is empty
///
/// Example:
/// ```dart
/// isNullOrEmpty(null)     // true
/// isNullOrEmpty('')       // true
/// isNullOrEmpty('  ')     // true
/// isNullOrEmpty([])       // true
/// isNullOrEmpty({})       // true
/// isNullOrEmpty([1])      // false
/// ```
bool isNullOrEmpty(Object? object) {
  if (object == null) return true;

  if (object is String) {
    return object.trim().isEmpty;
  }

  if (object is Iterable) {
    return object.isEmpty;
  }

  if (object is Map) {
    return object.isEmpty;
  }

  return false;
}
