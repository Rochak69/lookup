import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:lookup/core/hive/app_hive_type_id.dart';
import 'package:lookup/res/index.dart';

List<String> feedList = [
  'Stories',
  'Trending',
  'Best Working',
  'Dancing',
  'Dancing',
  'Dancing',
];
List<String> feedImages = [
  AppImages.feedTwo,
  AppImages.feedTwo,
  AppImages.feedThree,
  AppImages.feedTwo,
  AppImages.feedTwo,
  AppImages.feedThree,
  AppImages.feedTwo,
  AppImages.feedTwo,
  AppImages.feedThree,
];

@HiveType(typeId: AppHiveTypeId.feed)
class FeedModel {
  FeedModel(this.id, this.image);

  factory FeedModel.fromJson(String source) =>
      FeedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory FeedModel.fromMap(Map<String, dynamic> map) {
    return FeedModel(
      map['id'] as String,
      map['image'] as String,
    );
  }
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String image;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());
}
