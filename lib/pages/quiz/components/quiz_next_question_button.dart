import 'package:flutter/material.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class QuizNextQuestionButton extends StatelessWidget {
  const QuizNextQuestionButton({
    super.key,
    required VoidCallback onNext,
  }) : _onNext = onNext;

  final VoidCallback _onNext;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onNext,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: defaultPaddingS),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(defaultBorderRadiusM),
        ),
        child: Center(
          child: Text(
            '다음 문제',
            style: CustomTextStyle.body1.copyWith(color: white),
          ),
        ),
      ),
    );
  }
}
