import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solveconomy_simple/general_widget/general_divider.dart';
import 'package:solveconomy_simple/general_widget/general_shimmer.dart';
import 'package:solveconomy_simple/pages/news/news_page.dart';
import 'package:solveconomy_simple/service/naver_news/naver_news_service.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class HomeNewsCard extends StatefulWidget {
  const HomeNewsCard({super.key});

  @override
  State<HomeNewsCard> createState() => _HomeNewsCardState();
}

class _HomeNewsCardState extends State<HomeNewsCard> {
  late Future<List<dynamic>> _news;

  @override
  void initState() {
    super.initState();
    _news = Future.delayed(
      const Duration(milliseconds: 250),
      () => NaverNewsService().loadNews('경제'),
    );
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('News', style: CustomTextStyle.title3),
          const Gap(defaultGapS / 2),
          const GeneralDivider(),
          const Gap(defaultGapS / 2),
          FutureBuilder<List<dynamic>>(
            future: _news,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const GeneralShimmer(itemCount: 5);
              } else if (snapshot.hasError) {
                return const Center(child: Text('데이터를 불러오는 중 오류가 발생했습니다.'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('데이터가 없습니다.'));
              } else {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final news = snapshot.data![index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => NewsPage(newsUrl: news['link']),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _removeTagsAndDecode(news['title']),
                            style: CustomTextStyle.body1,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true,
                          ),
                          const Gap(defaultGapS),
                          Text(
                            _removeTagsAndDecode(news['description']),
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
                              '내용 더 보기',
                              style: CustomTextStyle.caption1.copyWith(color: gray),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Gap(defaultGapL),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  String _removeTagsAndDecode(String newsContent) {
    final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    String result = newsContent.replaceAll(exp, '');

    result = _decodeHtmlEntities(result);
    return result;
  }

  String _decodeHtmlEntities(String text) {
    return text
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&#035;', '#')
        .replaceAll('&#039;', "'");
  }
}
