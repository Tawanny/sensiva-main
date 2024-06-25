import 'package:flutter/material.dart';
import 'package:sensiva/core/core.dart';

class TabbarItem extends StatelessWidget {
  const TabbarItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 35,
      child: Card(
        elevation: 10,
        color: ThemeColors.cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
