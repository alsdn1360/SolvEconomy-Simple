import 'package:flutter/material.dart';
import 'package:solveconomy_simple/data/dictionary/dictionary_data.dart';
import 'package:solveconomy_simple/pages/dictionary/components/dictionary_card.dart';
import 'package:solveconomy_simple/pages/search/components/search_icon_button.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class DictionaryPage extends StatelessWidget {
  final List<DictionaryData> dictionaryData;

  const DictionaryPage({super.key, required this.dictionaryData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dictionary',
          style: CustomTextStyle.header1,
        ),
        actions: const [SearchIconButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPaddingM),
        child: ListView.builder(
          itemCount: dictionaryData.length,
          itemBuilder: (context, index) {
            final data = dictionaryData[index];
            return DictionaryCard(dictionaryData: data);
          },
        ),
      ),
    );
  }
}
