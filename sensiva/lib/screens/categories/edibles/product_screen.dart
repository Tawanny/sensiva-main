import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:ui_common/ui_common.dart';

import '../../../core/core.dart';
import '../../../shared/widgets.dart';
import '../aparatus/aparatus.dart';
import '../components/product_item.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = const AlwaysStoppedAnimation<double>(1);
    final sigma = 10 * animation.value;
    return SafeArea(
      child: Scaffold(
        body: Material(
          type: MaterialType.transparency,
          child: Hero(
            tag: 'id',
            child: Stack(
              fit: StackFit.expand,
              children: [
                const ParallaxImageCard(imageUrl: 'assets/images/muffins.jpeg'),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
                    child: const ColoredBox(color: Colors.black38),
                  ),
                ),
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 300,
                      automaticallyImplyLeading: false,
                      pinned: true,
                      floating: true,
                      title: const BackBtn(),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          child: Image.asset(
                            'assets/images/muffins.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      actions: const [
                        CartButton(),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StarRating(
                              rating: 4.5,
                              size: 15,
                            ),
                            const Gap(5),
                            Text(
                              'Wild Camomile & Pineapple muffins',
                              style: context.displaySmall.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ThemeColors.textColor,
                                fontSize: 25,
                              ),
                            ),
                            const Gap(20),
                            Text(
                              'Select Concentration',
                              style: context.titleMedium.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ThemeColors.textColor,
                              ),
                            ),
                            const Gap(10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 27,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: ThemeColors.prColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: ThemeColors.prColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    '5mg',
                                    style: context.bodyMedium.copyWith(
                                      color: ThemeColors.textColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                               CustomDivider(color: ThemeColors.textColor.withOpacity(0.5)),
                                Container(
                                  height: 27,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: ThemeColors.btnColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    '10mg',
                                    style: context.bodyMedium.copyWith(
                                      color: ThemeColors.textColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                CustomDivider(color: ThemeColors.textColor.withOpacity(0.5)),
                                Container(
                                  height: 27,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: ThemeColors.btnColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    '20mg',
                                    style: context.bodyMedium.copyWith(
                                      color: ThemeColors.textColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(20),
                            Text(
                              'Cannabis infused moist and fragrant muffins with a unique aromatic flavor ( a cross between zingy pineapple and soothing chamomile) made doubly scrumptious by the cream cheese filling.',
                              style: context.bodyMedium.copyWith(
                                color: ThemeColors.textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Accessories you might need..',
                                  style: context.titleMedium.copyWith(
                                    color: ThemeColors.textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(
                                      const Aparatus(),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      duration:
                                          const Duration(milliseconds: 500),
                                    );
                                  },
                                  child: Text(
                                    'View All',
                                    style: context.bodySmall.copyWith(
                                      color: ThemeColors.btnColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Gap(10),
                            SizedBox(
                              height: 260,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (BuildContext context, index) {
                                    return const ProductItem(
                                      name: 'Gizeh Rolling tray',
                                      imageUrl: 'assets/images/aparatus.jpg',
                                      price: 60.00,
                                      mgs: 0,
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomSheet: BottomAppBar(
          height: 70,
          color: ThemeColors.backgroundColor,
          child: SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'R60.00',
                  style: context.bodyLarge.copyWith(
                    color: ThemeColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  icon: const Icon(
                    IconlyBold.bag,
                    color: ThemeColors.btnColor,
                  ),
                  onPressed: () {},
                  label: Text(
                    'Add to Cart',
                    style: context.titleSmall.copyWith(
                      color: ThemeColors.btnColor,
                      fontWeight: FontWeight.bold,
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
