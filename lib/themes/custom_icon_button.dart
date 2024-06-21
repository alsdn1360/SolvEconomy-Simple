import 'package:flutter/material.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';

class CustomIconButtonTheme {
  static IconButtonThemeData customIconButtonThemeData() {
    return IconButtonThemeData(
      style: ButtonStyle(
        iconSize: MaterialStateProperty.all(24),
        iconColor: MaterialStateProperty.all(black),
      ),
    );
  }
}
