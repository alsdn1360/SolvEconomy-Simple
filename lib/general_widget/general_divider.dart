import 'package:flutter/material.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: gray,
      thickness: 0.5,
    );
  }
}
