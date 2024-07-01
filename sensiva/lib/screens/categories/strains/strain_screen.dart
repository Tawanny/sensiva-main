import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:sensiva/core/models/models.dart';
import 'package:sensiva/screens/categories/aparatus/aparatus.dart';
import 'package:ui_common/ui_common.dart';

import '../components/product_item.dart';

class StrainScreen extends StatelessWidget {
  const StrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StrainModel strain = Get.arguments;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  IconlyLight.arrow_left_2,
                  color: ThemeColors.textColor,
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: strain.id,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CircleAvatar(
                      radius: 150,
                      backgroundImage: AssetImage(
                        strain.imageUrl,
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconlyBold.bag,
                    color: ThemeColors.btnColor,
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StarRating(
                              rating: 4.5,
                              size: 15,
                            ),
                            const Gap(5),
                            Text(
                              strain.name,
                              style: context.displaySmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColors.textColor,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'R${strain.price}\\gram',
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ThemeColors.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Grade',
                              style: context.bodySmall.copyWith(
                                color: ThemeColors.textColor.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'AAA',
                              style: context.titleSmall.copyWith(
                                color: ThemeColors.textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 5),
                          child: Container(
                            color: ThemeColors.textColor.withOpacity(0.5),
                            width: 1,
                            height: 30,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Type',
                              style: context.bodySmall.copyWith(
                                color: ThemeColors.textColor.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Hybrid',
                              style: context.titleSmall.copyWith(
                                color: ThemeColors.textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      strain.desc,
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
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 500),
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
        bottomSheet: BottomAppBar(
          height: 70,
          color: ThemeColors.backgroundColor,
          child: SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        IconlyLight.plus,
                        color: ThemeColors.btnColor,
                        size: 20,
                      ),
                    ),
                    const Gap(5),
                    Text(
                      '10',
                      style: context.titleSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.textColor,
                      ),
                    ),
                    const Gap(5),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        IconlyLight.plus,
                        color: ThemeColors.btnColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                Text(
                  'grams',
                  style: context.titleMedium.copyWith(
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
