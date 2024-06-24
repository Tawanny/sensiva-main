import 'package:sensiva/core/shared/domain/entities/smart_device.dart';

import 'music_info.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.temperature,
    required this.airHumidity,
    required this.lights,
    required this.airCondition,
    required this.timer,
    required this.musicInfo,
  });

  final String id;
  final String name;
  final String imageUrl;
  final double temperature;
  final double airHumidity;
  final SmartDevice lights;
  final SmartDevice airCondition;
  final SmartDevice timer;
  final MusicInfo musicInfo;

  CategoryModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? temperature,
    double? airHumidity,
    SmartDevice? lights,
    SmartDevice? airCondition,
    SmartDevice? timer,
    MusicInfo? musicInfo,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        temperature: temperature ?? this.temperature,
        airHumidity: airHumidity ?? this.airHumidity,
        lights: lights ?? this.lights,
        airCondition: airCondition ?? this.airCondition,
        musicInfo: musicInfo ?? this.musicInfo,
        timer: timer ?? this.timer,
      );

  static List<CategoryModel> fakeValues = [
    _room,
    _room.copyWith(id: '2', name: 'PRE-ROLLED', imageUrl: _imagesUrls[1]),
    _room.copyWith(id: '3', name: 'EDIBLES', imageUrl: _imagesUrls[2]),
    _room.copyWith(id: '4', name: 'APARATUS', imageUrl: _imagesUrls[3]),
    _room.copyWith(id: '5', name: 'STRAINS', imageUrl: _imagesUrls[4]),
  ];
}

final _room = CategoryModel(
  id: '1',
  name: 'WEED NEWS',
  imageUrl: _imagesUrls[0],
  temperature: 12,
  airHumidity: 23,
  lights: SmartDevice(isOn: true, value: 20),
  timer: SmartDevice(isOn: false, value: 20),
  airCondition: SmartDevice(isOn: false, value: 10),
  musicInfo: MusicInfo(
    isOn: false,
    currentSong: Song.defaultSong,
  ),
);

const _imagesUrls = [
  'assets/images/weed_news.jpg',
  'assets/images/pre-rolled.jpg',
  'assets/images/edibles.jpg',
  'assets/images/aparatus.jpg',
  'assets/images/strains.png',
];
