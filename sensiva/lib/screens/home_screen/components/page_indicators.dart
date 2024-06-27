import 'package:flutter/material.dart';

import '../../../core/models/category_model.dart';
import '../../../core/theme/th_colors.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({
    super.key,
    required this.catSelectorNotifier,
    required this.pageNotifer,
  });

  final ValueNotifier catSelectorNotifier, pageNotifer;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: catSelectorNotifier,
        builder: (_, selectedPage, __) {
          return AnimatedOpacity(
            opacity: selectedPage == -1 ? 1 : 0,
            duration: const Duration(microseconds: 100),
            child: Center(
              /// we want to animated the dots when users are
              /// scrolling through the category pages
              child: ValueListenableBuilder(
                  valueListenable: pageNotifer,
                  builder: (_, pageIndex, __) {
                    return PageViewIndicators(
                      length: CategoryModel.fakeValues.length,
                      pageIndex: pageIndex,
                    );
                  }),
            ),
          );
        });
  }
}

class PageViewIndicators extends StatelessWidget {
  const PageViewIndicators({
    required this.length,
    required this.pageIndex,
    super.key,
  });

  final int length;
  final double pageIndex;

  @override
  Widget build(BuildContext context) {
    final index = pageIndex;
    return SizedBox(
      height: 12,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < length; i++) ...[
                const _Dot(),
                if (i < length - 1) const SizedBox(width: 16),
              ],
            ],
          ),
          Positioned(
            left: (16 * index) + (6 * index),
            child: const _BorderDot(),
          )
        ],
      ),
    );
  }
}

class _BorderDot extends StatelessWidget {
  const _BorderDot();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 2),
          color: ThemeColors.backgroundColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 6,
      height: 6,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ThemeColors.hintColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
