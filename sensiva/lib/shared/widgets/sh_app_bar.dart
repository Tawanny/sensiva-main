import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/theme/theme.dart';

class ShAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Hero(
        tag: "app-bar-icon-1",
        child: Material(
          type: MaterialType.transparency,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: ThemeColors.btnColor,
            ),
          ),
        ),
      ),
      actions: [
        Hero(
          tag: "app-bar-icon-2",
          child: Material(
            type: MaterialType.transparency,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.search,
                color: ThemeColors.btnColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
