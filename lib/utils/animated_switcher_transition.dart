import 'package:flutter/material.dart';

Widget scaleTransitionBuilder(
  Widget child,
  Animation<double> animation,
) {
  return ScaleTransition(
    scale: animation,
    child: child,
  );
}

Widget slideTransitionBuilder({
  required Widget child,
  required Animation<double> animation,
  Axis direction = Axis.vertical,
  double indentOffset = 2.0,
}) {
  final offsetAnimation = Tween(
    begin: Offset(
      direction == Axis.vertical
          ? 0.0
          : (animation.isCompleted ? indentOffset : -indentOffset),
      direction == Axis.vertical
          ? (animation.isCompleted ? indentOffset : -indentOffset)
          : 0.0,
    ),
    end: Offset.zero,
  ).animate(animation);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}
