import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/models/models.dart';
import 'package:sensiva/core/theme/theme.dart';
import 'package:sensiva/shared/widgets.dart';
import 'package:ui_common/ui_common.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsModel news = Get.arguments;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              expandedHeight: 250,
              automaticallyImplyLeading: false,
              title: const BackBtn(),
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  child: Image.asset(
                    news.imageUrl,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black45,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    news.title,
                    style: context.displayLarge.copyWith(
                      color: ThemeColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: CustomIconBtn(icon: Icons.more_vert),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.person,
                              color: ThemeColors.selectedColor,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                news.author,
                                style: context.bodyMedium.copyWith(
                                  color: ThemeColors.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomDivider(
                          color: ThemeColors.textColor.withOpacity(0.5),
                          height: 20,
                          leftPadding: 5,
                        ),
                        Text(
                          '${news.duration} min read',
                          style: context.bodyMedium.copyWith(
                            color: ThemeColors.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomDivider(
                          color: ThemeColors.textColor.withOpacity(0.5),
                          height: 20,
                          leftPadding: 5,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.thumb_up_alt_outlined,
                            color: ThemeColors.btnColor,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        news.subtitle,
                        style: context.titleMedium.copyWith(
                          color: ThemeColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        news.details,
                        style: context.bodyMedium.copyWith(
                          color: ThemeColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
