import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solveconomy_simple/pages/home/components/home_large_card.dart';
import 'package:solveconomy_simple/pages/home/components/home_news_card.dart';
import 'package:solveconomy_simple/pages/home/components/home_small_card.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int _randomIndex = 0;

  @override
  void initState() {
    super.initState();
    _randomIndex = _generateRandomNumber();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'solvEconomy',
          style: CustomTextStyle.header1.copyWith(color: primary),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          backgroundColor: primary,
          color: white,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(
                left: defaultPaddingM,
                right: defaultPaddingM,
                bottom: defaultPaddingM,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Expanded(child: HomeSmallCard(title: 'Quiz')),
                      Gap(defaultGapL),
                      Expanded(child: HomeSmallCard(title: 'Dictionary')),
                    ],
                  ),
                  const Gap(defaultGapL),
                  HomeLargeCard(randomIndex: _randomIndex),
                  const Gap(defaultGapL),
                  const HomeNewsCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    setState(() {
      _randomIndex = _generateRandomNumber();
    });
    await Future.delayed(const Duration(seconds: 1));
    _scrollController.jumpTo(_scrollController.position.minScrollExtent);
  }

  int _generateRandomNumber() {
    final random = Random();
    return random.nextInt(100) + 1;
  }
}