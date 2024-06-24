import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:ui_common/ui_common.dart';

import 'components/category_page_view.dart';
import '../../features/home/presentation/widgets/lighted_background.dart';
import 'components/page_indicators.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    controller..removeListener(pageListener);
  }

  @override
  Widget build(BuildContext context) {
    return LightedBackgound(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const ShAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text('What are you looking for today?', style: context.bodyLarge),
              height32,
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    CategoryPageView(
                      controller: controller,
                      pageNotfier: pageNotfier,
                      catSelectorNotifier: catSelectorNotifier,
                    ),
                    Positioned.fill(
                      top: null,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: PageIndicators(
                          catSelectorNotifier: catSelectorNotifier,
                          pageNotifer: pageNotfier,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[300],
          selectedItemColor: ThemeColors.prColor,
          iconSize: 20,
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  IconlyBold.home,
                  size: 30,
                ),
                icon: Icon(
                  IconlyLight.home,
                  size: 30,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
              activeIcon: Icon(
                IconlyBold.bag,
                size: 30,
              ),
              icon: Icon(
                IconlyLight.bag,
                size: 30,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                IconlyBold.document,
                size: 30,
              ),
              icon: Icon(
                IconlyLight.document,
                size: 30,
              ),
              label: 'Notes',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                IconlyBold.profile,
                size: 30,
              ),
              icon: Icon(
                IconlyLight.profile,
                size: 30,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
