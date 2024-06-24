import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

import '../../../core/shared/presentation/widgets/category_card.dart';
import '../../../core/shared/shared.dart';
import '../widgets/room_details_page_view.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({
    required this.category,
    super.key,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const ShAppBar(),
      body: CategoryItem(
        topPadding: context.mediaQuery.padding.top,
        category: category,
      ),
    );
  }
}

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
            // --------------------------------------------
            // Animated output elements
            // --------------------------------------------
            FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(animation),
              child: Stack(
                children: [
                  Transform.translate(
                      offset: Offset(-(200 * animation.value), 0),
                      child: VerticalRoomTitle(room: category)),
                  const CameraIconButton(),
                  const AnimatedUpwardArrows(),
                ],
              ),
            ),
            // --------------------------------------------
            // R‚oom controls
            // --------------------------------------------
            FadeTransition(
              opacity: animation,
              child: Container(
                padding: EdgeInsets.only(top: topPadding + 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      category.name.replaceAll(' ', '\n'),
                      textAlign: TextAlign.center,
                      style: context.displaySmall.copyWith(height: .9),
                    ),
                    const Text('SETTINGS', textAlign: TextAlign.center),
                    Expanded(
                      child: RoomDetailsPageView(
                        category: category,
                        animation: animation,
                      ),
                    )
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
