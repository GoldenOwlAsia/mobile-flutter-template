// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/src/utils/string.ext.dart';

void main() {
  group('String Extension', () {
    test('Trim url case 1', () {
      expect('http://google.com'.urlTrim(), 'google.com');
    });
    test('Trim url case 2', () {
      expect('http://google.com/'.urlTrim(), 'google.com');
    });
    test('Trim url case 3', () {
      expect('https://www.google.com'.urlTrim(), 'google.com');
    });
    test('Trim url case 4', () {
      expect('https://www.google.com/'.urlTrim(), 'google.com');
    });

    test('String validation', () {
      expect('test@example.com'.isValidEmail, true);
      expect('invalid-email'.isValidEmail, false);
      expect('12345'.isNumeric, true);
      expect('abc123'.isNumeric, false);
    });

    test('String formatting', () {
      expect('hello world'.capitalize, 'Hello world');
      expect('hello world'.capitalizeWords, 'Hello World');
    });
  });
}
