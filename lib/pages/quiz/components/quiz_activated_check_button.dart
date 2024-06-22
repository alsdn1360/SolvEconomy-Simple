import 'package:flutter/material.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class QuizActivatedCheckButton extends StatelessWidget {
  final String selectedAnswer;
  final String correctAnswer;
  final Function(bool isCorrect) onConfirm;

  const QuizActivatedCheckButton({
    super.key,
    required this.selectedAnswer,
    required this.correctAnswer,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        bool isCorrect = selectedAnswer == correctAnswer;
        onConfirm(isCorrect);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: defaultPaddingS),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(defaultBorderRadiusM),
        ),
        child: Center(
          child: Text(
            '답 확인하기',
            style: CustomTextStyle.body1.copyWith(color: white),
          ),
        ),
      ),
    );
  }
}
