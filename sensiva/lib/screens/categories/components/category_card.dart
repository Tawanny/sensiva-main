import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

import '../../../features/home/presentation/widgets/background_info_card.dart';
import '../../../shared/widgets.dart';
import 'category_item.dart';
import '../../../core/core.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.percent,
    required this.category,
    required this.expand,
    required this.onSwipeUp,
    required this.onSwipeDown,
    required this.onTap,
    super.key,
  });

  final double percent;
  final CategoryModel category;
  final VoidCallback onSwipeUp;
  final VoidCallback onSwipeDown;
  final VoidCallback onTap;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      tween: Tween(begin: 0, end: expand ? 1 : 0),
      builder: (_, value, __) => Stack(
        fit: StackFit.expand,
        children: [
          // -----------------------------------------------
          // Background information card
          // -----------------------------------------------
          Transform.scale(
            scale: lerpDouble(0.85, 1.2, value),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 80),
              child: CategoryInfoCard(category: category, translation: value),
            ),
          ),
          // -----------------------------------------------
          // category image card with parallax effect
          // -----------------------------------------------
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 70),
            child: Transform(
              transform: Matrix4.translationValues(0, -90 * value, 0),
              child: GestureDetector(
                onTap: onTap,
                onVerticalDragUpdate: (details) {
                  if (details.primaryDelta! < -10) onSwipeUp();
                  if (details.primaryDelta! > 10) onSwipeDown();
                },
                child: Hero(
                  tag: category.id,
                  flightShuttleBuilder: (flightContext, animation,
                      flightDirection, fromHeroContext, toHeroContext) {
                    return AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return CategoryItem(
                            category: category,
                            topPadding: context.mediaQuery.padding.top,
                            animation: animation,
                          );
                        });
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      ParallaxImageCard(
                        imageUrl: category.imageUrl,
                        parallaxValue: percent,
                      ),
                      VerticalRoomTitle(room: category),
                      const AnimatedUpwardArrows()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CameraIconButton extends StatelessWidget {
  const CameraIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.camera,
            color: ThemeColors.textColor,
          ),
        ),
      ),
    );
  }
}

class VerticalRoomTitle extends StatelessWidget {
  const VerticalRoomTitle({
    required this.room,
    super.key,
  });

  final CategoryModel room;

  @override
  Widget build(BuildContext context) {
    // final dx = 50 * animationValue;
    // final opacity = 1 - animationValue;
    return Align(
      alignment: Alignment.centerLeft,
      child: RotatedBox(
        quarterTurns: -1,
        child: FittedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 40.h, right: 20.h, top: 12.w),
            child: Text(
              room.name.replaceAll(' ', ''),
              maxLines: 1,
              style:
                  context.displayLarge.copyWith(color: ThemeColors.textColor),
            ),
          ),
        ),
      ),
    );
  }
}
