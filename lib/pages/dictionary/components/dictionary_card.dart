import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solveconomy_simple/data/dictionary_data.dart';
import 'package:solveconomy_simple/pages/dictionary/dictionary_detail_page.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class DictionaryCard extends StatelessWidget {
  final DictionaryData dictionaryData;

  const DictionaryCard({
    super.key,
    required this.dictionaryData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        dictionaryData.word,
        style: CustomTextStyle.body1,
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
      contentPadding: EdgeInsets.zero,
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => DictionaryDetailPage(dictionaryData: dictionaryData),
          ),
        );
      },
    );
  }
}
