import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/models/category_model.dart';
import '../../categories/components/category_card.dart';

class CategoryPageView extends StatelessWidget {
  const CategoryPageView({
    super.key,
    required this.controller,
    required this.pageNotfier,
    required this.catSelectorNotifier,
  });

  final PageController controller;
  final ValueNotifier pageNotfier;
  final ValueNotifier catSelectorNotifier;

  double _getOffsetX(double percent) => percent.isNegative ? 30 : -30;
  Matrix4 _getTranslation(
      {required double percent,
      required int selectedPage,
      required int index}) {
    final double x =
        selectedPage != index && selectedPage != 1 ? _getOffsetX(percent) : 0;
    return Matrix4.translationValues(x, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pageNotfier,
        builder: (_, page, __) {
          return ValueListenableBuilder(
              valueListenable: catSelectorNotifier,
              builder: (_, selectedCategory, __) {
                return PageView.builder(
                  controller: controller,
                  clipBehavior: Clip.none,
                  itemCount: CategoryModel.fakeValues.length,
                  itemBuilder: (_, index) {
                    final category = CategoryModel.fakeValues[index];
                    var percent = page - index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      transform: _getTranslation(
                        index: index,
                        selectedPage: selectedCategory,
                        percent: percent,
                      ),
                      child: CategoryCard(
                        percent: percent,
                        expand: selectedCategory == index,
                        category: category,
                        onSwipeUp: () => catSelectorNotifier.value = index,
                        onSwipeDown: () => catSelectorNotifier.value = -1,
                        onTap: () {
                          Get.to(
                            category.screen,
                            transition: Transition.fade,
                            duration: const Duration(milliseconds: 600),
                          );
                          catSelectorNotifier.value = -1;
                        },
                      ),
                    );
                  },
                );
              });
        });
  }
}
