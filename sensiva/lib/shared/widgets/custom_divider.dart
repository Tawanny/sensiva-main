import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.color,
    this.height = 30,
    this.rightPadding = 5,
    this.leftPadding = 20,
  });

  final Color color;
  final double height;
  final double rightPadding;
  final double leftPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: Container(
        color: color,
        width: 1,
        height: height,
      ),
    );
  }
}
