import 'package:flutter/material.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class CustomAppbarTheme {
  static AppBarTheme customAppBarThemeData() {
    return AppBarTheme(
      backgroundColor: white,
      titleTextStyle: CustomTextStyle.title2,
      titleSpacing: defaultPaddingM,
      toolbarHeight: 60,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
    );
  }
}
