import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:ui_common/ui_common.dart';
import 'components/cat_app_bar.dart';
import 'components/tabbar_item.dart';

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
      length: 5,
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
                                'Some catchy subtitle here!!',
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
                              text: 'Bongs',
                            ),
                            TabbarItem(
                              text: 'Lighters',
                            ),
                            TabbarItem(
                              text: 'Rizzla sdshhdfc dhhd',
                            ),
                            TabbarItem(
                              text: 'Filters',
                            ),
                            TabbarItem(
                              text: 'Oils',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Container(
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 260,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 5,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Card(
                                                elevation: 15,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Container(
                                                  height: 250,
                                                  width: 150,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const CircleAvatar(
                                                        radius: 50,
                                                        backgroundImage: AssetImage(
                                                            'assets/images/edibles.jpg'),
                                                      ),
                                                      const Gap(20),
                                                      Text(
                                                        'Sugar Dusted Jelly Candy',
                                                        style: context
                                                            .bodyMedium
                                                            .copyWith(
                                                          height: .9,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      const Gap(20),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            '10mg',
                                                            style: context
                                                                .bodyMedium
                                                                .copyWith(
                                                              height: .9,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 20,
                                                            width: 70,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .black,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6)),
                                                            child: Text(
                                                              'R200',
                                                              style: context
                                                                  .titleSmall
                                                                  .copyWith(
                                                                height: .9,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Icon(
                                                            IconlyLight.plus,
                                                            color: ThemeColors
                                                                .prColor,
                                                          ),
                                                          Icon(
                                                            IconlyLight.heart,
                                                            color: ThemeColors
                                                                .prColor,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: 260,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 5,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Card(
                                                elevation: 15,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Container(
                                                  height: 250,
                                                  width: 150,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const CircleAvatar(
                                                        radius: 50,
                                                        backgroundImage: AssetImage(
                                                            'assets/images/edibles.jpg'),
                                                      ),
                                                      const Gap(20),
                                                      Text(
                                                        'Sugar Dusted Jelly Candy',
                                                        style: context
                                                            .bodyMedium
                                                            .copyWith(
                                                          height: .9,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      const Gap(20),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            '10mg',
                                                            style: context
                                                                .bodyMedium
                                                                .copyWith(
                                                              height: .9,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 20,
                                                            width: 70,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .black,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6)),
                                                            child: Text(
                                                              'R200',
                                                              style: context
                                                                  .titleSmall
                                                                  .copyWith(
                                                                height: .9,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Icon(
                                                            IconlyLight.plus,
                                                            color: ThemeColors
                                                                .prColor,
                                                          ),
                                                          Icon(
                                                            IconlyLight.heart,
                                                            color: ThemeColors
                                                                .prColor,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              Container(color: Colors.transparent),
                              Container(color: Colors.transparent),
                              Container(color: Colors.transparent),
                              Container(color: Colors.transparent),
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
