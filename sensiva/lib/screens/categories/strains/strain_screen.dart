import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:sensiva/core/models/models.dart';
import 'package:ui_common/ui_common.dart';

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
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  IconlyLight.arrow_left_2,
                  color: ThemeColors.selectedColor,
                ),
              ),
              centerTitle: true,
              title: Text(
                strain.name,
                style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.textColor,
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      child: Hero(
                        tag: strain.id,
                        child: Image.asset(
                          strain.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ThemeColors.prColor.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    )
                  ],
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 20),
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
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconlyLight.bag,
                    color: ThemeColors.textColor,
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    Text(
                      'Description',
                      style: context.titleLarge.copyWith(
                        color: ThemeColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      strain.desc,
                      style: context.bodyMedium.copyWith(
                        color: ThemeColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
