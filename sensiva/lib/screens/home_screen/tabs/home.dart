import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_common/ui_common.dart';

import '../components/category_page_view.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.controller,
    required this.pageNotfier,
    required this.catSelectorNotifier,
  });

  final PageController controller;
  final ValueNotifier<double> pageNotfier;
  final ValueNotifier<int> catSelectorNotifier;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text('Sensiva',
              style: context.displaySmall.copyWith(
                color: Colors.white,
              )),
          const Gap(24),
          Text('What are you looking for today?', style: context.bodyLarge),
          const Gap(32),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                CategoryPageView(
                  controller: controller,
                  pageNotfier: pageNotfier,
                  catSelectorNotifier: catSelectorNotifier,
                ),
                // Positioned.fill(
                //   top: null,
                //   child: Padding(
                //     padding: const EdgeInsets.only(bottom: 30.0),
                //     child: PageIndicators(
                //       catSelectorNotifier: catSelectorNotifier,
                //       pageNotifer: pageNotfier,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
