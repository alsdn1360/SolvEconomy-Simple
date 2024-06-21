import 'package:flutter/material.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';

/// 기본 폰트
const TextStyle baseTextStyle = TextStyle(
  color: black,
  fontFamily: 'Pretendard',
  leadingDistribution: TextLeadingDistribution.even,
  fontWeight: FontWeight.w400,
);

class CustomTextStyle {
  // Titles
  /// App bar title1: 24, 1.25, w400, black
  static TextStyle title1 = const TextStyle(
    fontFamily: 'GamjaFlower',
    fontSize: 24,
    height: 1.2,
    color: black,
    fontWeight: FontWeight.w400,
  );
  /// App bar title2: 20, 1.25, w700, black
  static TextStyle title2 = baseTextStyle.copyWith(
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w700,
  );

  // Headers
  /// Header1: 20, 1.2, w700, black
  static TextStyle header1 = baseTextStyle.copyWith(
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w700,
  );
  /// Header2: 16, 1.2, w700, black
  static TextStyle header2 = baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w700,
  );
  /// Header3: 14, 1.1875, w700, black
  static TextStyle header3 = baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.1875,
  );

  // Paragraphs
  /// Paragraph1: 16, 1.1875, w400, black
  static TextStyle paragraph1 = baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.1875,
  );
  /// Paragraph2: 14, 1.167, w400, black
  static TextStyle paragraph2 = baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.167,
  );
  /// Paragraph3: 12, 1.167, w400, black
  static TextStyle paragraph3 = baseTextStyle.copyWith(
    fontSize: 12,
    height: 1.167,
  );
  /// Paragraph4: 10 1.167, w400, black
  static TextStyle paragraph4 = baseTextStyle.copyWith(
    fontSize: 10,
    height: 1.167,
  );
}
