import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solveconomy_simple/general_widget/general_divider.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class HomeLargeCard extends StatelessWidget {
  const HomeLargeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPaddingM,
        vertical: defaultPaddingS,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: darkWhite,
        borderRadius: BorderRadius.circular(defaultBorderRadiusM),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dictionary', style: CustomTextStyle.title3),
                const Spacer(),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),
          const Gap(defaultGapS / 2),
          const CustomDivider(),
          const Gap(defaultGapS / 2),
          GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('테스트 용어', style: CustomTextStyle.body1),
                const Gap(defaultGapS),
                Text(
                  '테스트 용어 설명',
                  style: CustomTextStyle.body3,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: true,
                ),
                const Gap(defaultGapS),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '설명 더 보기',
                    style: CustomTextStyle.caption1.copyWith(color: gray),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
