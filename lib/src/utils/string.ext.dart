/// String extensions for common string operations
/// Provides convenient methods for string manipulation, validation, and formatting
extension StringExtensions on String {
  /// Check if string contains only whitespace characters
  bool get isBlank => trim().isEmpty;

  /// Check if string is not blank (contains non-whitespace characters)
  bool get isNotBlank => trim().isNotEmpty;

  /// Check if string is a valid email address
  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Check if string is a valid phone number (basic validation)
  bool get isValidPhoneNumber {
    final phoneRegex = RegExp(r'^[\+]?[1-9][\d]{0,15}$');
    return phoneRegex.hasMatch(replaceAll(RegExp(r'[\s\-\(\)]'), ''));
  }

  /// Check if string is a valid URL
  bool get isValidUrl {
    try {
      final uri = Uri.parse(this);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }

  /// Check if string contains only numeric characters
  bool get isNumeric => RegExp(r'^[0-9]+$').hasMatch(this);

  /// Check if string contains only alphabetic characters
  bool get isAlphabetic => RegExp(r'^[a-zA-Z]+$').hasMatch(this);

  /// Check if string contains only alphanumeric characters
  bool get isAlphanumeric => RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);

  // MARK: - String Formatting

  /// Capitalize first letter of the string
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Capitalize first letter of each word
  String get capitalizeWords {
    if (isEmpty) return this;
    return split(' ')
        .map((word) => word.isEmpty ? word : word.capitalize)
        .join(' ');
  }

  /// Get file extension from path or URL
  String get fileExtension {
    final lastDot = lastIndexOf('.');
    final lastSlash = lastIndexOf('/');

    if (lastDot > lastSlash && lastDot != -1) {
      return substring(lastDot + 1).toLowerCase();
    }
    return '';
  }

  // MARK: - String Generation

  /// Generate random string of specified length
  static String random(int length,
      {bool includeNumbers = true, bool includeSymbols = false}) {
    const letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

    String chars = letters;
    if (includeNumbers) chars += numbers;
    if (includeSymbols) chars += symbols;

    final random = DateTime.now().millisecondsSinceEpoch;
    return List.generate(
        length, (index) => chars[(random + index) % chars.length]).join();
  }

  String urlTrim() {
    String text = trim().toLowerCase();
    for (final e in ['https://www.', 'http://www.', 'https://', 'http://']) {
      if (text.indexOf(e) == 0) {
        text = text.substring(e.length);
      }
    }
    if (text.isNotEmpty && text[text.length - 1] == '/') {
      text = text.substring(0, text.length - 1);
    }
    return text;
  }
}
