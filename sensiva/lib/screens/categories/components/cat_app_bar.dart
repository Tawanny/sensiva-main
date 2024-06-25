import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ui_common/ui_common.dart';

import '../../../core/core.dart';

class CatAppBar extends StatelessWidget {
  const CatAppBar({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          ),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 25,
          ),
        ),
        Text(
          category.name,
          textAlign: TextAlign.center,
          style: context.displaySmall.copyWith(height: .9),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          ),
          icon: const Icon(
            IconlyLight.search,
            color: ThemeColors.btnColor,
            size: 25,
          ),
        ),
      ],
    );
  }
}
