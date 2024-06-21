import 'package:flutter/material.dart';
import 'package:solveconomy_simple/pages/main/main_page.dart';
import 'package:solveconomy_simple/themes/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.customThemeData(),
      home: const MainPage(),
    );
  }
}