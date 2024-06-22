import 'package:flutter/material.dart';
import 'package:solveconomy_simple/pages/main/components/main_introduce_word.dart';
import 'package:solveconomy_simple/pages/main/components/main_start_button.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 140,
            bottom: 72,
            left: defaultPaddingM,
            right: defaultPaddingM,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroduceWord(),
              Spacer(),
              StartButton(),
            ],
          ),
        ),
      ),
    );
  }
}
