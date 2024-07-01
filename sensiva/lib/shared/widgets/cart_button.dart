import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../core/core.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    this.btnColor = ThemeColors.prColor,
  });

  final Color btnColor;

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
          child: const Icon(
            IconlyLight.bag,
            color: ThemeColors.textColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
