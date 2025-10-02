import 'package:flutter/material.dart';
import 'package:test_2048/assets/colors.dart';

class Tiles extends StatelessWidget {
  final int number;
  const Tiles({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getColorsFromNumber(number),
      child: Center(child: Text('$number')),
    );
  }
}
