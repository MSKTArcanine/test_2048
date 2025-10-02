import 'package:flutter/material.dart';
import 'package:test_2048/assets/board.dart';

class BoardUI extends StatelessWidget {
  final Board board;

  const BoardUI({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    final tiles = board.generateTiles(); // or board.tiles if you store them

    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 1,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      children: tiles,
    );
  }
}
