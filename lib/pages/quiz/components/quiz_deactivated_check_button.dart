import 'package:flutter/material.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class QuizDeactivatedCheckButton extends StatelessWidget {
  const QuizDeactivatedCheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: defaultPaddingS),
      decoration: BoxDecoration(
        color: darkWhite,
        borderRadius: BorderRadius.circular(defaultBorderRadiusM),
      ),
      child: Center(
        child: Text(
          '답 확인하기',
          style: CustomTextStyle.body1.copyWith(color: lightGray),
        ),
      ),
    );
  }
}
