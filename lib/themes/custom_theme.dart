import 'package:flutter/material.dart';
import 'package:solveconomy_simple/themes/custom_appbar.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_icon_button.dart';
import 'package:solveconomy_simple/themes/custom_text_selection.dart';

class CustomTheme {
  static ThemeData customThemeData() {
    return ThemeData(
      useMaterial3: true,

      /// 앱바 테마 설정
      appBarTheme: CustomAppbarTheme.customAppBarThemeData(),

      /// 아이콘 테마 설정
      iconButtonTheme: CustomIconButtonTheme.customIconButtonThemeData(),

      /// 텍스트 선택 테마 설정
      textSelectionTheme: CustomTextSelectionTheme.customTextSelectionThemeData(),

      /// 컬러 설정
      scaffoldBackgroundColor: white,
      primaryColor: primary,
      splashColor: transparent,
      highlightColor: transparent,
      applyElevationOverlayColor: false,
    );
  }
}
