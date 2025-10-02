import 'package:flutter/material.dart';

const Map<int, MaterialColor> colors = {
  2: Colors.cyan,
  4: Colors.amber,
  8: Colors.blueGrey,
  16: Colors.brown,
  32: Colors.deepOrange,
  64: Colors.deepPurple,
};

MaterialColor getColorsFromNumber(int number) {
  return colors[number] ?? Colors.grey;
}
