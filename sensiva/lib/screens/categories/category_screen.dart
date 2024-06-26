import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:ui_common/ui_common.dart';
import 'components/cat_app_bar.dart';
import 'components/tabbar_item.dart';
import 'edibles/tabs/baked.dart';
import 'edibles/tabs/candy.dart';
import 'edibles/tabs/drinks.dart';
import 'edibles/tabs/ice_cream.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    Animation<double> animation = const AlwaysStoppedAnimation<double>(1);
    final sigma = 10 * animation.value;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.search,
                color: ThemeColors.btnColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.bag,
                color: ThemeColors.btnColor,
              ),
            ),
          ],
        ),
        body: Material(
          type: MaterialType.transparency,
          child: Hero(
            tag: widget.category.id,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                ParallaxImageCard(imageUrl: widget.category.imageUrl),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
                    child: const ColoredBox(color: Colors.transparent),
                  ),
                ),
                FadeTransition(
                  opacity: animation,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: context.mediaQuery.padding.top + 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 30, 0, 15),
                          child: ListTile(
                            title: Text(
                              widget.category.name,
                              style: context.titleLarge.copyWith(
                                height: .9,
                                color: ThemeColors.textColor,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'For all the food lovers who can\'t smoke',
                                style: context.bodyMedium.copyWith(
                                  height: .9,
                                  color: ThemeColors.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const TabBar(
                          dividerColor: Colors.transparent,
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          indicatorColor: Colors.transparent,
                          tabs: [
                            TabbarItem(
                              text: 'Baked',
                            ),
                            TabbarItem(
                              text: 'Candy',
                            ),
                            TabbarItem(
                              text: 'Drinks',
                            ),
                            TabbarItem(
                              text: 'Ice Cream and Sobert',
                            ),
                          ],
                        ),
                        const Expanded(
                          child: TabBarView(
                            children: [
                              Baked(),
                              Candy(),
                              Drinks(),
                              IceCream(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
