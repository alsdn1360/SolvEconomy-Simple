import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:solveconomy_simple/data/dictionary_data.dart';
import 'package:solveconomy_simple/general_widget/general_divider.dart';
import 'package:solveconomy_simple/general_widget/general_progress_indicator.dart';
import 'package:solveconomy_simple/pages/dictionary/dictionary_detail_page.dart';
import 'package:solveconomy_simple/pages/dictionary/dictionary_page.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class HomeLargeCard extends StatefulWidget {
  const HomeLargeCard({super.key});

  @override
  State<HomeLargeCard> createState() => _HomeLargeCardState();
}

class _HomeLargeCardState extends State<HomeLargeCard> {
  late Future<List<DictionaryData>> _dictionaryData;
  late int _randomIndex;

  @override
  void initState() {
    super.initState();
    _dictionaryData = DictionaryData.loadDictionaryData();
    _randomIndex = _generateRandomNumber();
  }

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
      child: FutureBuilder(
        future: _dictionaryData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: GeneralProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('데이터를 불러오는 중 오류가 발생했습니다.'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('데이터가 없습니다.'));
          } else {
            final dictionaryData = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => DictionaryPage(dictionaryData: dictionaryData),
                      ),
                    );
                  },
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
                const GeneralDivider(),
                const Gap(defaultGapS / 2),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => DictionaryDetailPage(
                          dictionaryData: dictionaryData[_randomIndex],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(dictionaryData[_randomIndex].word, style: CustomTextStyle.body1),
                      const Gap(defaultGapS),
                      Text(
                        dictionaryData[_randomIndex].description,
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
            );
          }
        },
      ),
    );
  }

  int _generateRandomNumber() {
    final random = Random();
    return random.nextInt(100) + 1;
  }
}
