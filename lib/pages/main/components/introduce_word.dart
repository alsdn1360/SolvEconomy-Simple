import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class IntroduceWord extends StatelessWidget {
  const IntroduceWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: '어려운 경제 용어\n', style: CustomTextStyle.header1),
              TextSpan(
                text: '솔브이코노미',
                style: CustomTextStyle.header1.copyWith(color: primary),
              ),
              TextSpan(
                text: '로 풀어보기',
                style: CustomTextStyle.header1,
              ),
            ],
          ),
        ),
        const Gap(defaultGapS / 2),
        Text(
          '어렵기만 했던 경제 용어\n솔브이코노미로 쉽게 친해져보세요!',
          style: CustomTextStyle.paragraph3.copyWith(color: darkGray),
        ),
      ],
    );
  }
}
