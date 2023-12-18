import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:lookup/core/hive/app_hive_type_id.dart';
import 'package:lookup/res/index.dart';

List<HomeFeed> feedList = [
  HomeFeed(feedName: 'Stories'),
  HomeFeed(feedName: 'Trending'),
  HomeFeed(feedName: 'Best Working'),
  HomeFeed(feedName: 'Dancing'),
  HomeFeed(feedName: 'Dancing'),
  HomeFeed(feedName: 'Dancing'),
];

class HomeFeed {
  HomeFeed({required this.feedName});

  final String feedName;
  final List<FeedModel> homeFeeds = [
    FeedModel(0, AppImages.feedTwo),
    FeedModel(1, AppImages.feedThree),
    FeedModel(2, AppImages.feedTwo),
    FeedModel(3, AppImages.feedThree),
    FeedModel(4, AppImages.feedTwo),
    FeedModel(5, AppImages.feedThree),
    FeedModel(6, AppImages.feedTwo),
    FeedModel(7, AppImages.feedThree),
    FeedModel(8, AppImages.feedTwo),
  ];
}

@HiveType(typeId: AppHiveTypeId.feed)
class FeedModel {
  FeedModel(this.id, this.image);

  factory FeedModel.fromJson(String source) =>
      FeedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory FeedModel.fromMap(Map<String, dynamic> map) {
    return FeedModel(
      map['id'] as int,
      map['image'] as String,
    );
  }
  @HiveField(0)
  final int id;
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
