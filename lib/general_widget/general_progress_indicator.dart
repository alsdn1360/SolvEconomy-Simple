import 'package:flutter/material.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';

class GeneralProgressIndicator extends StatelessWidget {
  const GeneralProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(primary),
      ),
    );
  }
}