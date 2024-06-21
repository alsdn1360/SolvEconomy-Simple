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
  /// App bar title1: 24, 1.25, w700, black
  static TextStyle title1 = const TextStyle(
    fontFamily: 'FuzzyBubbles',
    fontSize: 20,
    height: 1.2,
    color: black,
    fontWeight: FontWeight.w700,
  );
  /// App bar title2: 20, 1.25, w700, black
  static TextStyle title2 = baseTextStyle.copyWith(
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w800,
    color: black,
  );

  // Headers
  /// Header1: 20, 1.2, w700, black
  static TextStyle header1 = baseTextStyle.copyWith(
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: black,
  );
  /// Header2: 18, 1.2, w700, black
  static TextStyle header2 = baseTextStyle.copyWith(
    fontSize: 18,
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: black,
  );
  /// Header3: 16, 1.1875, w700, black
  static TextStyle header3 = baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.1875,
    fontWeight: FontWeight.w700,
    color: black,
  );

  // Paragraphs
  /// Paragraph1: 16, 1.1875, w400, black
  static TextStyle paragraph1 = baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.1875,
    fontWeight: FontWeight.w400,
    color: black,
  );
  /// Paragraph2: 14, 1.167, w700, black
  static TextStyle paragraph2 = baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.167,
    fontWeight: FontWeight.w700,
    color: black,
  );
  /// Paragraph3: 14, 1.167, w400, black
  static TextStyle paragraph3 = baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.167,
    fontWeight: FontWeight.w400,
    color: black,
  );
  /// Paragraph4: 12, 1.167, w700, black
  static TextStyle paragraph4 = baseTextStyle.copyWith(
    fontSize: 12,
    height: 1.167,
    fontWeight: FontWeight.w700,
    color: black,
  );
  /// Paragraph5: 12, 1.167, w400, black
  static TextStyle paragraph5 = baseTextStyle.copyWith(
    fontSize: 12,
    height: 1.167,
    fontWeight: FontWeight.w400,
    color: black,
  );
}
