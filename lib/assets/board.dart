import 'dart:math';

import 'package:test_2048/assets/utils.dart';
import 'package:test_2048/tiles.dart';

class Board {
  late final List<List<int>> _board;

  Board() {
    _board = Utils().generateBoard();
  }

  int getAt(int row, int col) {
    if (row < 0 || row >= _board.length) return -1;
    if (col < 0 || col >= _board[row].length) return -1;
    return _board[row][col];
  }

  bool placeAt(int row, int col, int number) {
    if (getAt(row, col) == -1) {
      return false;
    }
    if (getAt(row, col) != 0) {
      return false;
    }
    _board[row][col] = number;
    return true;
  }

  List<List<int>> getBoard() {
    return _board;
  }

  List<Tiles> generateTiles() {
    return List.generate(
      16,
      (i) => Tiles(number: _board.expand((x) => x).toList()[i]),
    );
  }

  void addRandom() {
    int row = Random().nextInt(4);
    int col = Random().nextInt(4);
    while (!placeAt(row, col, 2)) {
      row = Random().nextInt(4);
      col = Random().nextInt(4);
    }
  }

  void swipeLeft() {
    for (List<int> row in _board) {
      Utils().swipeLeft(row);
    }
  }

  void swipeRight() {
    for (int i = 0; i < _board.length; i++) {
      List<int> row = _board[i].reversed.toList();
      Utils().swipeLeft(row);
      _board[i] = row.reversed.toList();
    }
  }

  void swipeUp() {
    Utils().transpose(_board);
    swipeLeft();
    Utils().transpose(_board);
  }

  void swipeDown() {
    Utils().transpose(_board);
    swipeRight();
    Utils().transpose(_board);
  }

  Board getBoardFromList(List<List<int>> list) {
    Board newBoard = Board();
    newBoard._board = list;
    return newBoard;
  }
}
