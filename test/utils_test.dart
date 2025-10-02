import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_2048/assets/utils.dart';

void main() {
  test('[1,1,0,0] should be [2,0,0,0]', () {
    final List<int> list = [1, 1, 0, 0];
    final List<int> res = Utils().swipeLeft(list);
    expect(listEquals(res, [2, 0, 0, 0]), isTrue);
  });

  test('[1,0,0,0] shouldnt be modified', () {
    final List<int> list = [1, 0, 0, 0];
    final List<int> res = Utils().swipeLeft(list);
    expect(listEquals(res, [1, 0, 0, 0]), isTrue);
  });

  test('[1,1,2,2] should be [2,0,4,0]', () {
    final List<int> list = [1, 1, 2, 2];
    final List<int> res = Utils().swipeLeft(list);
    expect(listEquals(res, [2, 0, 4, 0]), isTrue);
  });

  test('[2,0,4,0] should be [2,4,0,0]', () {
    final List<int> list = [2, 0, 4, 0];
    final List<int> res = Utils().clearFromZeroes(list);
    expect(listEquals(res, [2, 4, 0, 0]), isTrue);
  });

  test('[1,1,2,2] should be [2,4,0,0]', () {
    final List<int> list = [1, 1, 2, 2];
    final List<int> res = Utils().clearFromZeroes(Utils().swipeLeft(list));
    expect(listEquals(res, [2, 4, 0, 0]), isTrue);
  });

  test('Slides [0,2,0,4] to [2,4,0,0] correctly', () {
    final List<int> list = [0, 2, 0, 4];
    final List<int> res = Utils().fullSwipeLeft(list);
    expect(listEquals(res, [2, 4, 0, 0]), isTrue);
  });
}
