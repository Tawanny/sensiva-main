import 'package:flutter/material.dart';

import '../../screens/categories/categories.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.shortDesc,
    this.screen,
    this.tabLength,
  });

  final String id, name, imageUrl, shortDesc;

  final Widget? screen;
  final int? tabLength;

  CategoryModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? shortDesc,
    Widget? screen,
    int? tabLength,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        screen: screen ?? this.screen,
        tabLength: tabLength ?? this.tabLength,
        shortDesc: shortDesc ?? this.shortDesc,
      );

  static List<CategoryModel> fakeValues = [
    _room,
    _room.copyWith(
        id: '5',
        name: 'STRAINS',
        imageUrl: _imagesUrls[3],
        tabLength: 4,
        screen: const Strains(),
        shortDesc: 'Indoor AAA - AA - A grade Strains, cultivated between 19-32% THC.'),
    _room.copyWith(
      id: '3',
      name: 'EDIBLES',
      imageUrl: _imagesUrls[1],
      tabLength: 4,
      screen: const Edibles(),
      shortDesc: 'Variety consumables infused with only the best.'
    ),
    _room.copyWith(
      id: '4',
      name: 'ACCESORIES',
      imageUrl: _imagesUrls[2],
      tabLength: 4,
      screen: const Aparatus(),
      shortDesc: 'All you might need to make your smoking experience effortless and more enjoyable',
    ),
  ];
}

final _room = CategoryModel(
  id: '1',
  name: 'WEED NEWS',
  imageUrl: _imagesUrls[0],
  screen: const News(),
  shortDesc: 'Stay updated and Informed with the News and Quick advice.'
);

const _imagesUrls = [
  'assets/images/weed_news.jpg',
  'assets/images/edibles.jpg',
  'assets/images/aparatus.jpg',
  'assets/images/strains.png',
];
