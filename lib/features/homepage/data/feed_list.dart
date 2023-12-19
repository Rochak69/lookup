import 'dart:convert';

import 'package:lookup/res/index.dart';

List<HomeFeed> feedList = [
  HomeFeed(feedName: 'Stories', homeFeeds: feeds),
  HomeFeed(feedName: 'Trending', homeFeeds: feeds),
  HomeFeed(feedName: 'Best Working', homeFeeds: feeds),
  HomeFeed(feedName: 'Dancing', homeFeeds: feeds),
  HomeFeed(feedName: 'Dancing', homeFeeds: feeds),
  HomeFeed(feedName: 'Dancing', homeFeeds: feeds),
];
List<FeedModel>? feeds = [
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

class HomeFeed {
  HomeFeed({required this.feedName, this.homeFeeds});

  final String feedName;
  List<FeedModel>? homeFeeds;

  HomeFeed copyWith({String? feedName, List<FeedModel>? homeFeeds}) {
    return HomeFeed(
      feedName: feedName ?? this.feedName,
      homeFeeds: homeFeeds ?? this.homeFeeds,
    );
  }
}

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

  final int id;

  final String image;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());
}
