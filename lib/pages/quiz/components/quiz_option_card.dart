import 'package:flutter/material.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class QuizOptionCard extends StatelessWidget {
  final String answer;
  final String? selectedAnswer;
  final bool isAnswerConfirmed;
  final bool isEnabled;
  final ValueChanged<String?> onAnswerSelected;
  final String correctAnswer;

  const QuizOptionCard({
    super.key,
    required this.answer,
    required this.selectedAnswer,
    required this.isAnswerConfirmed,
    required this.isEnabled,
    required this.onAnswerSelected,
    required this.correctAnswer,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedAnswer == answer;
    bool isCorrectAnswer = answer == correctAnswer;

    Color borderColor;
    Color backgroundColor = darkWhite;
    IconData? icon;
    Color iconColor;
    Color textColor;
    FontWeight fontWeight;

    if (isAnswerConfirmed) {
      if (isCorrectAnswer) {
        borderColor = green;
        backgroundColor = green.withOpacity(0.1);
        icon = Icons.check_circle_rounded;
        iconColor = green;
        textColor = green;
        fontWeight = FontWeight.w600;
      } else if (isSelected) {
        borderColor = red;
        backgroundColor = red.withOpacity(0.1);
        icon = Icons.cancel_rounded;
        iconColor = red;
        textColor = red;
        fontWeight = FontWeight.w600;
      } else {
        borderColor = darkWhite;
        icon = null;
        iconColor = transparent;
        textColor = black;
        fontWeight = FontWeight.w400;
      }
    } else {
      borderColor = isSelected ? primary : darkWhite;
      icon = null;
      iconColor = transparent;
      textColor = isSelected ? primary : black;
      fontWeight = isSelected ? FontWeight.w600 : FontWeight.w400;
    }

    return InkWell(
      onTap: isEnabled ? () => onAnswerSelected(answer) : null,
      child: Container(
        padding: const EdgeInsets.all(defaultPaddingS),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(defaultBorderRadiusM),
          border: Border.all(color: borderColor, width: 2.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              answer,
              style: CustomTextStyle.body2.copyWith(
                color: textColor,
                fontWeight: fontWeight,
              ),
            ),
            if (icon != null) Icon(icon, color: iconColor, size: 20),
          ],
        ),
      ),
    );
  }
}
