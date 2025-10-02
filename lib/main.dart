import 'package:flutter/material.dart';
import 'package:test_2048/assets/board.dart';
import 'package:test_2048/assets/swipe_directions.dart';
import 'package:test_2048/board_ui.dart';
import 'package:test_2048/swipable_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // State ^
}

class _MyHomePageState extends State<MyHomePage> {
  final Board board = Board(); // Lift le state, donc il a le board

  void handleSwipe(SwipeDirections dir) {
    switch (dir) {
      case SwipeDirections.left:
        board.swipeLeft();
        break;
      case SwipeDirections.right:
        board.swipeRight();
        break;
      case SwipeDirections.down:
        board.swipeDown();
        break;
      case SwipeDirections.up:
        board.swipeUp();
        break;
    }
    board.addRandom();
    setState(() {
      board.getBoard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final boardSize = constraints.biggest.shortestSide * 0.8;
            return SizedBox(
              width: boardSize,
              height: boardSize,
              child: SwipableContainer(
                onSwipe: handleSwipe, // On passe le handleswipe
                child: BoardUI(board: board), //pwet.
              ),
            );
          },
        ),
      ),
    );
  }
}
