import 'package:flutter/material.dart';
import 'package:solveconomy_simple/data/dictionary_data.dart';
import 'package:solveconomy_simple/pages/dictionary/components/dictionary_card.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class SearchPage extends StatefulWidget {
  final List<DictionaryData> dictionaryData;

  const SearchPage({
    super.key,
    required this.dictionaryData,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _queryController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<DictionaryData> _searchedWords = [];

  @override
  void initState() {
    super.initState();
    _clearSearch();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _queryController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            color: darkWhite,
            borderRadius: BorderRadius.circular(defaultBorderRadiusM),
          ),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear_rounded),
                onPressed: _clearSearch,
              ),
              contentPadding: const EdgeInsets.only(left: defaultPaddingS),
              hintText: '궁금한 경제 용어를 입력해 주세요.',
              hintStyle: CustomTextStyle.body3.copyWith(color: gray),
              border: InputBorder.none,
            ),
            controller: _queryController,
            focusNode: _focusNode,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.search,
            style: CustomTextStyle.body3,
            cursorWidth: 1,
            onChanged: _searchWords,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPaddingM),
        child: ListView.builder(
          itemCount: _searchedWords.length,
          itemBuilder: (context, index) {
            final word = _searchedWords[index];
            return DictionaryCard(dictionaryData: word);
          },
        ),
      ),
    );
  }

  void _searchWords(String query) {
    final results =
        widget.dictionaryData.where((data) => data.word.toLowerCase().contains(query.toLowerCase())).toList();

    setState(() {
      _searchedWords = results;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchedWords = [];
      _queryController.clear();
    });
  }
}
