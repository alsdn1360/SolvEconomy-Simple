import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';

class GeneralShimmer extends StatelessWidget {
  final int itemCount;

  const GeneralShimmer({
    super.key,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: lightGray,
      highlightColor: darkWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(itemCount, (index) => _buildShimmerItem())
            .expand((item) => [item, const Gap(defaultGapL)])
            .toList(),
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 15,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(defaultBorderRadiusM / 2),
          ),
        ),
        const Gap(defaultGapS),
        Container(
          width: double.infinity,
          height: 30,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(defaultBorderRadiusM / 2),
          ),
        ),
        const Gap(defaultGapS),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 60,
            height: 15,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(defaultBorderRadiusM / 2),
            ),
          ),
        ),
      ],
    );
  }
}
