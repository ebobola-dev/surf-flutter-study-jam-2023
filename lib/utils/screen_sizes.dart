import 'package:flutter/material.dart';
import 'dart:math' show min, max;

Size getScreenSize(BuildContext context) => MediaQuery.of(context).size;

Size getScreenSizeWithoutContext() =>
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

double getMinSideWidth(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return min(screenSize.width, screenSize.height);
}

double getMaxSideWidth(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return max(screenSize.width, screenSize.height);
}
