import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solveconomy_simple/pages/home/home_page.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false,
        );
      },
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadiusM),
        ),
        child: Center(
          child: Text(
            '시작 하기',
            style: CustomTextStyle.title2.copyWith(color: primary),
          ),
        ),
      ),
    );
  }
}
