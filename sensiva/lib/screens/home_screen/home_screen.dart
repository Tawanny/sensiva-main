import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:sensiva/screens/home_screen/tabs/account.dart';
import 'package:sensiva/screens/home_screen/tabs/favourite.dart';
import 'package:ui_common/ui_common.dart';

import '../../features/home/presentation/widgets/lighted_background.dart';
import '../../shared/shared.dart';
import 'tabs/cart.dart';
import 'tabs/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;
  final controller = PageController(viewportFraction: 0.8);
  final ValueNotifier<double> pageNotfier = ValueNotifier(0);
  final ValueNotifier<int> catSelectorNotifier = ValueNotifier(-1);

  @override
  void initState() {
    super.initState();
    controller.addListener(pageListener);
  }

  ///This fn enables parallax scrolling
  void pageListener() {
    pageNotfier.value = controller.page ?? 0;
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(pageListener);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> tabs = [
      Home(
        controller: controller,
        pageNotfier: pageNotfier,
        catSelectorNotifier: catSelectorNotifier,
      ),
      const Favourite(),
      const Cart(),
      const Account(),
    ];
    return LightedBackgound(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: const ShAppBar(),
        body: tabs[currentIndex],
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: catSelectorNotifier,
            builder: (_, selectedPage, __) {
              return AnimatedOpacity(
                opacity: selectedPage == -1 ? 1 : 0,
                duration: const Duration(microseconds: 100),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * .024),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(
                          () {
                            currentIndex = index;
                          },
                        );
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            margin: const EdgeInsets.only(right: 20, left: 20),
                            width: 50,
                            height: index == currentIndex ? 5 : 0,
                            decoration: const BoxDecoration(
                              color: ThemeColors.prColor,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10),
                              ),
                            ),
                          ),
                          Icon(
                            index == currentIndex
                                ? selectedIcons[index]
                                : unselectedIcons[index],
                            size: 25,
                            color: ThemeColors.prColor,
                          ),
                          Text(
                            listOfTitles[index],
                            style: context.bodyMedium.copyWith(
                              color: ThemeColors.prColor,
                              fontWeight: index == currentIndex
                                  ? FontWeight.bold
                                  : FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  List<IconData> unselectedIcons = [
    IconlyLight.home,
    IconlyLight.heart,
    IconlyLight.bag,
    IconlyLight.profile,
  ];

  List<IconData> selectedIcons = [
    IconlyBold.home,
    IconlyBold.heart,
    IconlyBold.bag,
    IconlyBold.profile,
  ];
  List<String> listOfTitles = [
    'Home',
    'Favourites',
    'Cart',
    'Account',
  ];
}
