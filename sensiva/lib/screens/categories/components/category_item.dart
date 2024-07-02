import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_common/ui_common.dart';

import '../../../core/core.dart';
import '../../../shared/widgets.dart';
import 'cat_app_bar.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.category,
    required this.topPadding,
    this.animation = const AlwaysStoppedAnimation<double>(1),
    super.key,
  });

  final double topPadding;
  final CategoryModel category;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final sigma = 10 * animation.value;
    return Material(
      type: MaterialType.transparency,
      child: Hero(
        tag: category.id,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            ParallaxImageCard(imageUrl: category.imageUrl),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
                child: const ColoredBox(color: Colors.transparent),
              ),
            ),
            FadeTransition(
              opacity: animation,
              child: Container(
                padding:
                    EdgeInsets.only(top: context.mediaQuery.padding.top + 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Gap(20),
                    CatAppBar(category: category),
                    const Gap(70),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}