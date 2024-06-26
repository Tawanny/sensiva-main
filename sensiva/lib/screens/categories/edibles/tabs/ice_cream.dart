import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/theme/th_colors.dart';
import 'package:ui_common/ui_common.dart';

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
            ListTile(
              title: Text(
                'Ice Cream',
                style: context.titleMedium.copyWith(
                  height: .9,
                  color: Colors.white,
                ),
              ),
              trailing: Text(
                'Explore more..',
                style: context.bodyMedium.copyWith(
                  height: .9,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
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
                              const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/muffins.jpeg'),
                              ),
                              const Gap(10),
                              Text(
                                'Wild Camomile and Weed pineapple keto muffins',
                                style: context.bodyMedium.copyWith(
                                  height: .9,
                                  color: Colors.black,
                                ),
                              ),
                              const Gap(20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '10mg',
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
                                      'R200',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                    );
                  }),
            ),
            ListTile(
              title: Text(
                'Sobert',
                style: context.titleMedium.copyWith(
                  height: .9,
                  color: Colors.white,
                ),
              ),
              trailing: Text(
                'Explore more..',
                style: context.bodyMedium.copyWith(
                  height: .9,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
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
                              const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(
                                    'assets/images/helado-marihuana.jpg'),
                              ),
                              const Gap(20),
                              Text(
                                'Blueberry and Mint sobert',
                                style: context.bodyMedium.copyWith(
                                  height: .9,
                                  color: Colors.black,
                                ),
                              ),
                              const Gap(20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '10mg',
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
                                      'R200',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
