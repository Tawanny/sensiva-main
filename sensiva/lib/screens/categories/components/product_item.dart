import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:ui_common/ui_common.dart';

import '../../../core/theme/theme.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.mgs,
    required this.price,
    required this.name,
    required this.imageUrl,
  });
  final double mgs;
  final double price;
  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 250,
            width: 150,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(imageUrl),
                ),
                const Gap(20),
                Text(
                  name,
                  style: context.bodyMedium.copyWith(
                    height: .9,
                    color: Colors.black,
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$mgs',
                      style: context.bodyMedium.copyWith(
                        height: .9,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        'R$price',
                        style: context.titleSmall.copyWith(
                          height: .9,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      IconlyLight.plus,
                      color: ThemeColors.prColor,
                    ),
                    Icon(
                      IconlyLight.heart,
                      color: ThemeColors.prColor,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
