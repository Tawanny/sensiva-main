import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/theme/th_colors.dart';
import 'package:ui_common/ui_common.dart';

import '../../components/product_heading.dart';
import '../../components/product_item.dart';

class IceCream extends StatelessWidget {
  const IceCream({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductHeading(heading: 'Ice Cream'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductItem(
                      name: 'Cannabis infused Ice Cream',
                      imageUrl: 'assets/images/ice_cream.jpeg',
                      price: 70,
                      mgs: 10,
                    );
                  }),
            ),
            const ProductHeading(heading: 'Sobert'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductItem(
                      name: 'Blueberry and Pistachio Sobert',
                      imageUrl: 'assets/images/sobert.jpg',
                      price: 150,
                      mgs: 20,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
