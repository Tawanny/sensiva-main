import 'package:flutter/material.dart';
import 'package:sensiva/core/core.dart';
import 'package:ui_common/ui_common.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          'This is were the favorites go, to make it easy for customers to find what they like based on their selection or their frequent purchases.',
          textAlign: TextAlign.center,
          style: context.displayMedium.copyWith(
            color: ThemeColors.textColor,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
