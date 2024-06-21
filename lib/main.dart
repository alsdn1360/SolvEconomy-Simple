import 'package:flutter/material.dart';
import 'package:solveconomy_simple/pages/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'solvEconomy',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const StartPage(),
    );
  }
}