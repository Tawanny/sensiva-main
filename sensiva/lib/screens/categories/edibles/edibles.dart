import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:sensiva/shared/widgets.dart';
import 'package:ui_common/ui_common.dart';

import '../components/tabbar_item.dart';
import 'tabs/baked.dart';
import 'tabs/candy.dart';
import 'tabs/drinks.dart';
import 'tabs/ice_cream.dart';

class Edibles extends StatefulWidget {
  const Edibles({
    super.key,
  });

  @override
  State<Edibles> createState() => _EdiblesState();
}

class _EdiblesState extends State<Edibles> {
  @override
  Widget build(BuildContext context) {
    Animation<double> animation = const AlwaysStoppedAnimation<double>(1);
    final sigma = 10 * animation.value;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.search,
                color: ThemeColors.btnColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.bag,
                color: ThemeColors.btnColor,
              ),
            ),
          ],
        ),
        body: Material(
          type: MaterialType.transparency,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              const ParallaxImageCard(imageUrl: 'assets/images/edibles.jpg'),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
                  child: const ColoredBox(color: Colors.transparent),
                ),
              ),
              FadeTransition(
                opacity: animation,
                child: Container(
                  padding:
                      EdgeInsets.only(top: context.mediaQuery.padding.top + 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 30, 0, 15),
                        child: ListTile(
                          title: Text(
                            'Edibles',
                            style: context.displaySmall.copyWith(
                              height: .9,
                              color: ThemeColors.textColor,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'For all the food lovers who can\'t smoke',
                              style: context.bodyMedium.copyWith(
                                height: .9,
                                color: ThemeColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const TabBar(
                        dividerColor: Colors.transparent,
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: Colors.transparent,
                        tabs: [
                          TabbarItem(
                            text: 'Baked',
                          ),
                          TabbarItem(
                            text: 'Candy',
                          ),
                          TabbarItem(
                            text: 'Drinks',
                          ),
                          TabbarItem(
                            text: 'Ice Cream and Sobert',
                          ),
                        ],
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            Baked(),
                            Candy(),
                            Drinks(),
                            IceCream(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
