import 'package:flutter/material.dart';

import '../../core/core.dart';

class CustomIconBtn extends StatelessWidget {
  const CustomIconBtn({
    super.key,
    this.btnColor = ThemeColors.prColor, required this.icon,
  });

  final Color btnColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 10,
        color: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child:  Icon(
            icon,
            color: ThemeColors.textColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
