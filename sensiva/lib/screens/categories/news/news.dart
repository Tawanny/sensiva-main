import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:sensiva/screens/categories/components/cat_app_bar.dart';
import 'package:sensiva/screens/categories/news/tabs/news_tab.dart';
import 'package:ui_common/ui_common.dart';
import '../components/tabbar_item.dart';

class News extends StatefulWidget {
  const News({
    super.key,
  });

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    Animation<double> animation = const AlwaysStoppedAnimation<double>(1);
    final sigma = 10 * animation.value;
    return DefaultTabController(
      length: 2,
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
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              const ParallaxImageCard(imageUrl: 'assets/images/weed_news.jpg'),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 30, 0, 15),
                        child: ListTile(
                          title: Text(
                            'News and Advice',
                            style: context.titleLarge.copyWith(
                              height: .9,
                              color: ThemeColors.textColor,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Stay up to date and be Advised',
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
                            text: 'News',
                          ),
                          TabbarItem(
                            text: 'Quick Advice',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                           const NewsTab(),
                            Container(
                              color: Colors.blue,
                            ),
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
