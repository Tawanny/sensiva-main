import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:ui_common/ui_common.dart';

class Strains extends StatefulWidget {
  const Strains({
    super.key,
  });

  @override
  State<Strains> createState() => _StrainsState();
}

class _StrainsState extends State<Strains> {
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
              const ParallaxImageCard(imageUrl: 'assets/images/weed_news.jpg'),
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
                        padding: const EdgeInsets.fromLTRB(5, 30, 0, 0),
                        child: ListTile(
                          title: Text(
                            'Strains',
                            style: context.titleLarge.copyWith(
                              height: .9,
                              color: ThemeColors.textColor,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'What\'s your poison? We got it all',
                              style: context.bodyMedium.copyWith(
                                height: .9,
                                color: ThemeColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            controller: ScrollController(),
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, index) {
                              return Container(
                                height: 200,
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.only(left: 50, bottom: 20),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 6, 30, 19),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(70),
                                    bottomLeft: Radius.circular(70),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 70,
                                          backgroundImage: AssetImage(
                                              'assets/images/weed_news.jpg'),
                                        ),
                                        const Gap(20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Sativa',
                                              style:
                                                  context.titleLarge.copyWith(
                                                height: .9,
                                                color: ThemeColors.textColor,
                                              ),
                                            ),
                                            const Gap(20),
                                            Text(
                                              'for Cerebral and Euphoric highs',
                                              style:
                                                  context.bodyMedium.copyWith(
                                                height: .9,
                                                color: ThemeColors.textColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              IconlyLight.info_circle,
                                              color: ThemeColors.btnColor,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                IconlyLight.arrow_right_circle,
                                                color: ThemeColors.btnColor,
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
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
