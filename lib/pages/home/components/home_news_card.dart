import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solveconomy_simple/general_widget/general_divider.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class HomeNewsCard extends StatelessWidget {
  const HomeNewsCard({super.key});

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
          Text('News', style: CustomTextStyle.title3),
          const Gap(defaultGapS / 2),
          const CustomDivider(),
          const Gap(defaultGapS / 2),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '테스트 뉴스 제목',
                      style: CustomTextStyle.body1,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                    ),
                    const Gap(defaultGapS),
                    Text(
                      '테스트 뉴스 내용',
                      style: CustomTextStyle.body3,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: true,
                    ),
                    const Gap(defaultGapS / 2),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '내용 더 보기',
                        style: CustomTextStyle.caption1.copyWith(color: gray),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Gap(defaultGapL),
          ),
        ],
      ),
    );
  }
}
