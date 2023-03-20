import 'package:logger/logger.dart';

Logger xLog = Logger();

class Utils {
  List<T> listOf<T>(dynamic map, T toElement(dynamic e)) {
    if (map != null && map is List) {
      return map.map(toElement).toList();
    }
    return [];
  }

  static bool isStringEqual(String? val1, String? val2) {
    return val1?.trim().toLowerCase() == val2?.trim().toLowerCase();
  }

  static bool isMatchSearch(String name, String query) {
    final _name = name.toLowerCase();
    final _query = query.toLowerCase();
    return _name.contains(_query) || _name.contains(_query);
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
