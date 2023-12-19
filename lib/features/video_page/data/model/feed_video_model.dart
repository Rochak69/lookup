import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:lookup/core/hive/app_hive_type_id.dart';
part 'feed_video_model.g.dart';

@HiveType(typeId: AppHiveTypeId.likeShareCount)
class FeedVideoModel {
  FeedVideoModel({this.feedId, this.like, this.share});

  factory FeedVideoModel.fromMap(Map<String, dynamic> map) {
    return FeedVideoModel(
      feedId: map['feedId'] as int,
      like: map['like'] != null ? map['like'] as int : null,
      share: map['share'] != null ? map['share'] as int : null,
    );
  }

  factory FeedVideoModel.fromJson(String source) =>
      FeedVideoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @HiveField(0)
  final int? feedId;
  @HiveField(1)
  final int? like;
  @HiveField(2)
  final int? share;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'feedId': feedId,
      'like': like,
      'share': share,
    };
  }

  String toJson() => json.encode(toMap());
}
