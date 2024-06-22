import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solveconomy_simple/pages/search/search_page.dart';

class SearchIconButton extends StatelessWidget {
  const SearchIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).push(
          CupertinoPageRoute(
            builder: (context) => const SearchPage(),
          ),
        );
      },
      icon: const Icon(Icons.search_rounded),
    );
  }
}