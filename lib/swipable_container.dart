import 'package:flutter/material.dart';
import 'package:test_2048/assets/swipe_directions.dart';

class SwipableContainer extends StatefulWidget {
  final Widget child;
  final void Function(SwipeDirections) onSwipe;

  const SwipableContainer({
    super.key,
    required this.child,
    required this.onSwipe,
  });

  @override
  State<SwipableContainer> createState() => _SwipableContainerState();
}

class _SwipableContainerState extends State<SwipableContainer> {
  Offset? _startPosition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (dsd) {
        _startPosition = dsd.localPosition;
      },
      onPanEnd: (dsd) {
        if (_startPosition == null) {
          return;
        }
        final d = dsd.velocity.pixelsPerSecond;
        final dx = d.dx;
        final dy = d.dy;
        if (dx.abs() > dy.abs()) {
          if (dx > 0) {
            widget.onSwipe(SwipeDirections.right);
          } else {
            widget.onSwipe(SwipeDirections.left);
          }
        } else {
          if (dy > 0) {
            widget.onSwipe(SwipeDirections.down);
          } else {
            widget.onSwipe(SwipeDirections.up);
          }
        }
        _startPosition = null;
      },
      child: widget.child,
    );
  }
}
