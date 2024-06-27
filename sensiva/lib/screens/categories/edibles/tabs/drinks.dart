import 'package:flutter/material.dart';
import '../../components/product_heading.dart';
import '../../components/product_item.dart';

class Drinks extends StatelessWidget {
  const Drinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductHeading(heading: 'Energy Drinks'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductItem(
                      name: 'Cannabis Light - Hemp energy drink',
                      imageUrl: 'assets/images/weed_drink.png',
                      price: 80,
                      mgs: 20,
                    );
                  }),
            ),
            const ProductHeading(heading: 'Soft Drinks'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductItem(
                      name: 'Lemon and Lime Giant',
                      imageUrl: 'assets/images/soft_drink.jpg',
                      price: 50,
                      mgs: 10,
                    );
                  }),
            ),
            const ProductHeading(heading: 'Juices'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductItem(
                      name: 'Cannabis infused Juice',
                      imageUrl: 'assets/images/juice.jpg',
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
