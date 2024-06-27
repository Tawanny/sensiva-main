import 'package:flutter/material.dart';

import '../../components/product_heading.dart';
import '../../components/product_item.dart';

class Baked extends StatelessWidget {
  const Baked({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductHeading(heading: 'Muffins'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductItem(
                      name: 'Wild Camomile & pineapple muffins',
                      imageUrl: 'assets/images/muffins.jpeg',
                      price: 200,
                      mgs: 20,
                    );
                  }),
            ),
            const ProductHeading(heading: 'Cookies'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductItem(
                      name: 'Choc chip Cookies',
                      imageUrl: 'assets/images/cookies.jpeg',
                      price: 100,
                      mgs: 20,
                    );
                  }),
            ),
            const ProductHeading(heading: 'Baked Fudge'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductItem(
                      name: 'Cannabis infused stawberry Fudge',
                      imageUrl: 'assets/images/fudge.jpeg',
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
