import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../core/core.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
    this.btnColor = ThemeColors.prColor,
  });

  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
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
          child: const Icon(
            IconlyBold.arrow_left_2,
            color: ThemeColors.textColor,
          ),
        ),
      ),
    );
  }
}