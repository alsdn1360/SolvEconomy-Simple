import 'package:flutter/material.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class HomeSmallCard extends StatelessWidget {
  final String title;

  const HomeSmallCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPaddingM,
          vertical: defaultPaddingS,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: darkWhite,
          borderRadius: BorderRadius.circular(defaultBorderRadiusM),
        ),
        child: Row(
          children: [
            Text(title, style: CustomTextStyle.title3),
            const Spacer(),
            const Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}
