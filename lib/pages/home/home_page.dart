import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solveconomy_simple/pages/home/components/home_large_card.dart';
import 'package:solveconomy_simple/pages/home/components/home_news_card.dart';
import 'package:solveconomy_simple/pages/home/components/home_small_card.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'solvEconomy',
          style: CustomTextStyle.header1.copyWith(color: primary),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Expanded(child: HomeSmallCard(title: 'Quiz')),
                    Gap(defaultGapL),
                    Expanded(child: HomeSmallCard(title: 'Review')),
                  ],
                ),
                const Gap(defaultGapL),
                HomeLargeCard(),
                const Gap(defaultGapL),
                HomeNewsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

