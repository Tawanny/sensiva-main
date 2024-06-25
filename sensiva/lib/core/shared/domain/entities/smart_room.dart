import 'package:flutter/material.dart';
import 'package:sensiva/screens/categories/aparatus/aparatus.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.screen,
    this.tabLength,
  });

  final String id;
  final String name;
  final String imageUrl;
  final Widget? screen;
  final int? tabLength;

  CategoryModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    Widget? screen,
    int? tabLength,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        screen: screen ?? this.screen,
        tabLength: tabLength ?? this.tabLength,
      );

  static List<CategoryModel> fakeValues = [
    _room,
    _room.copyWith(
      id: '2',
      name: 'PRE-ROLLED',
      imageUrl: _imagesUrls[1],
      tabLength: 4,
      screen: const Aparatus(),
    ),
    _room.copyWith(
      id: '3',
      name: 'EDIBLES',
      imageUrl: _imagesUrls[2],
      tabLength: 4,
      screen: const Aparatus(),
    ),
    _room.copyWith(
      id: '4',
      name: 'APARATUS',
      imageUrl: _imagesUrls[3],
      tabLength: 4,
      screen: const Aparatus(),
    ),
    _room.copyWith(
      id: '5',
      name: 'STRAINS',
      imageUrl: _imagesUrls[4],
      tabLength: 4,
      screen: const Aparatus(),
    ),
  ];
}

final _room = CategoryModel(
  id: '1',
  name: 'WEED NEWS',
  imageUrl: _imagesUrls[0],
);

const _imagesUrls = [
  'assets/images/weed_news.jpg',
  'assets/images/pre-rolled.jpg',
  'assets/images/edibles.jpg',
  'assets/images/aparatus.jpg',
  'assets/images/strains.png',
];
