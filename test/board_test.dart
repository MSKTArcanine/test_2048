import 'package:flutter_test/flutter_test.dart';
import 'package:test_2048/assets/board.dart';
import 'package:test_2048/tiles.dart';

void main() {
  test('Generate the board correctly', () {
    final Board board = Board();
    expect(board.getAt(0, 0), equals(0));
    expect(board.getAt(6, 0), equals(-1));
    expect(board.getAt(0, 5), equals(-1));
    expect(board.getAt(7, 4), equals(-1));
    expect(board.getAt(4, 0), equals(-1));
    expect(board.getAt(5, 5), equals(-1));
    expect(board.getAt(3, 3), equals(0));
  });

  test('Correctly places numbers', () {
    final Board board = Board();
    board.placeAt(0, 0, 2);
    expect(board.getAt(0, 0), equals(2));
  });

  test('Generate Tiles accordingly', () {
    final Board board = Board();
    final List<Tiles> list = board.generateTiles();
    expect(list[0], isA<Tiles>());
    expect(list[15], isA<Tiles>());
  });
}
