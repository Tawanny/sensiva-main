import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:sensiva/screens/screens.dart';
import 'package:ui_common/ui_common.dart';

import '../../../core/models/models.dart';

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
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 30, 0, 15),
                        child: ListTile(
                          title: Text(
                            'Strains',
                            style: context.displaySmall.copyWith(
                              height: .9,
                              color: ThemeColors.textColor,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'What\'s your poison? We got it all.',
                              style: context.bodyMedium.copyWith(
                                height: .9,
                                color: ThemeColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.custom(
                          gridDelegate: SliverWovenGridDelegate.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            pattern: [
                              const WovenGridTile(1),
                              const WovenGridTile(
                                5 / 7,
                                crossAxisRatio: 0.9,
                                alignment: AlignmentDirectional.centerEnd,
                              ),
                            ],
                          ),
                          childrenDelegate: SliverChildBuilderDelegate(
                            (context, index) => StrainItem(index: index),
                            childCount: strains.length,
                          ),
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

  // ignore: non_constant_identifier_names
  StrainItem({required int index}) {
    var strain = strains[index];
    return InkWell(
      onTap: () => Get.to(
        () => const StrainScreen(),
        arguments: strain,
        transition: Transition.zoom,
        duration: const Duration(seconds: 1),
      ),
      child: Card(
        elevation: 10,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Hero(
          tag: strain.id,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(strain.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      strain.name,
                      style: context.titleSmall.copyWith(
                        color: ThemeColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'R${strain.price}/gram',
                          style: context.bodyMedium.copyWith(
                            color: ThemeColors.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Get.to(
                            () => const StrainScreen(),
                            arguments: strain,
                            transition: Transition.rightToLeftWithFade,
                            duration: const Duration(seconds: 1),
                          ),
                          icon: const Icon(
                            IconlyBold.arrow_right_circle,
                            color: ThemeColors.btnColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
