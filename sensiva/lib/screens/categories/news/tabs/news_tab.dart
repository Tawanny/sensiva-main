import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sensiva/core/models/models.dart';
import 'package:sensiva/core/theme/theme.dart';
import 'package:sensiva/screens/screens.dart';
import 'package:ui_common/ui_common.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: newsList.length,
        itemBuilder: (BuildContext context, index) {
          NewsModel news = newsList[index];
          return InkWell(
            onTap: () => Get.to(
              () => const NewsDetails(),
              transition: Transition.zoom,
              duration: const Duration(milliseconds: 700),
              arguments: news,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  height: 360,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage(news.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          news.subtitle,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.displayMedium.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${news.duration} min read',
                              textAlign: TextAlign.center,
                              style: context.bodySmall.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.thumb_up_alt_outlined,
                              color: ThemeColors.prColor,
                              size: 20,
                            ),
                            const Icon(
                              Icons.more_vert,
                              color: ThemeColors.prColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
