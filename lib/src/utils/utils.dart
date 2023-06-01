import 'package:logger/logger.dart';

Logger xLog = Logger();

class Utils {
  List<T> listOf<T>(dynamic map, T Function(dynamic e) toElement) {
    if (map != null && map is List) {
      return map.map(toElement).toList();
    }
    return [];
  }

  static bool isStringEqual(String? val1, String? val2) {
    return val1?.trim().toLowerCase() == val2?.trim().toLowerCase();
  }

  static bool isMatchSearch(String name, String query) {
    final name0 = name.toLowerCase();
    final query0 = query.toLowerCase();
    return name0.contains(query0) || name0.contains(query0);
  }

  static bool isMatchAllSearch(List<String> names, String query) {
    for (final name in names) {
      if (isMatchSearch(name, query)) {
        return true;
      }
    }
    return false;
  }

  static String fullnameOf(String? first, String? last,
      {String separated = ' '}) {
    if (first?.isNotEmpty != true) {
      return last ?? '';
    }
    if (last?.isNotEmpty != true) {
      return first!;
    }
    return '$first$separated$last';
  }

  static List<T> toggleList<T>(List<T> list, T value) {
    final List<T> newList = List.from(list);
    if (newList.contains(value)) {
      newList.remove(value);
    } else {
      newList.add(value);
    }
    return newList;
  }
}

bool isNullOrEmpty(Object? object) {
  if (object == null) {
    return true;
  }
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
