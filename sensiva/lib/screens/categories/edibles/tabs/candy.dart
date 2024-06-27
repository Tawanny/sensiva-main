import 'package:flutter/material.dart';
import '../../components/product_heading.dart';
import '../../components/product_item.dart';

class Candy extends StatelessWidget {
  const Candy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductHeading(heading: 'Gummies'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductItem(
                      name: 'Sugar Dusted Jelly Candy',
                      imageUrl: 'assets/images/edibles.jpg',
                      price: 150,
                      mgs: 20,
                    );
                  }),
            ),
            const ProductHeading(heading: 'Sweets'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductItem(
                      name: 'Cannabis Infused Lolipop',
                      imageUrl: 'assets/images/lolipop.png',
                      price: 40,
                      mgs: 10,
                    );
                  }),
            ),
            const ProductHeading(heading: 'Chocolates'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductItem(
                      name: 'Cannabis infused Dark Chocolate',
                      imageUrl: 'assets/images/chocolate.jpg',
                      price: 100,
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
