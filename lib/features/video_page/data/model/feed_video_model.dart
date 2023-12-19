import 'dart:convert';

import 'package:lookup/features/video_page/domain/entity/feed_video_entity.dart';

class FeedVideoModel extends FeedVideoEntity {
  FeedVideoModel({
    super.feedId,
    super.like,
    super.share,
  });

  factory FeedVideoModel.fromMap(Map<String, dynamic> map) {
    return FeedVideoModel(
      feedId: map['feedId'] as int,
      like: map['like'] != null ? map['like'] as int : null,
      share: map['share'] != null ? map['share'] as int : null,
    );
  }

  factory FeedVideoModel.fromJson(String source) =>
      FeedVideoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'feedId': feedId,
      'like': like,
      'share': share,
    };
  }

  String toJson() => json.encode(toMap());
}
