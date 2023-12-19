import 'package:hive/hive.dart';
import 'package:lookup/core/hive/app_hive_type_id.dart';
part 'feed_video_entity.g.dart';

@HiveType(typeId: AppHiveTypeId.likeShareCount)
class FeedVideoEntity {
  FeedVideoEntity({
    this.feedId,
    this.like,
    this.share,
  });
  @HiveField(0)
  int? feedId;
  @HiveField(1)
  int? like;
  @HiveField(2)
  int? share;
}
