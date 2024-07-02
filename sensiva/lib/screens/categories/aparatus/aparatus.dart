import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:ui_common/ui_common.dart';
import '../../../shared/widgets.dart';
import '../components/tabbar_item.dart';

class Aparatus extends StatefulWidget {
  const Aparatus({
    super.key,
  });

  @override
  State<Aparatus> createState() => _AparatusState();
}

class _AparatusState extends State<Aparatus> {
  @override
  Widget build(BuildContext context) {
    Animation<double> animation = const AlwaysStoppedAnimation<double>(1);
    final sigma = 10 * animation.value;
    return DefaultTabController(
      length: 5,
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
              const ParallaxImageCard(imageUrl: 'assets/images/aparatus.jpg'),
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
                            'Aparatus',
                            style: context.titleLarge.copyWith(
                              height: .9,
                              color: ThemeColors.textColor,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Make your smoking effortless and enjoyable',
                              style: context.bodyMedium.copyWith(
                                height: .9,
                                color: ThemeColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const TabBar(
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              indicatorColor: Colors.transparent,
                              dividerColor: Colors.transparent,
                              tabs: [
                                TabbarItem(
                                  text: 'Bongs',
                                ),
                                TabbarItem(
                                  text: 'Lighters',
                                ),
                                TabbarItem(
                                  text: 'Rizzla',
                                ),
                                TabbarItem(
                                  text: 'Filters',
                                ),
                                TabbarItem(
                                  text: 'Oils',
                                ),
                              ],
                            ),
                            Expanded(
                                child: TabBarView(
                              children: [
                                Container(color: Colors.transparent),
                                Container(color: Colors.transparent),
                                Container(color: Colors.transparent),
                                Container(color: Colors.transparent),
                                Container(color: Colors.transparent),
                              ],
                            ))
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
