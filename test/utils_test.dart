import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/src/utils/utils.dart';

void main() {
  group('Test chunk list', () {
    test('chunk list into smaller chunks', () {
      List<int> list = [1, 2, 3, 4];
      expect(Utils.chunk(list, 1), [
        [1],
        [2],
        [3],
        [4],
      ]);
      expect(Utils.chunk(list, 2), [
        [1, 2],
        [3, 4],
      ]);
      expect(Utils.chunk(list, 3), [
        [1, 2, 3],
        [4],
      ]);
      expect(Utils.chunk(list, 4), [
        [1, 2, 3, 4],
      ]);
      expect(Utils.chunk(list, 5), [
        [1, 2, 3, 4],
      ]);
    });
  });
}
