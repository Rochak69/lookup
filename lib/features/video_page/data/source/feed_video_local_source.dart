import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/hive/app_hive_box.dart';
import 'package:lookup/features/video_page/data/model/like_share_count_model.dart';
import 'package:lookup/features/video_page/enum/user_feed_intereaction.dart';

@lazySingleton
class FeedVideoLocalSource {
  LikeShareCount? getFeedDetails({required int feedId}) {
    const boxName = AppHiveBox.likeShareCount;
    final box = Hive.box<LikeShareCount?>(boxName);
    var likeShareCount = box.get(feedId);
    return likeShareCount;
  }

  LikeShareCount? updateFeedDetails({
    required int feedId,
    required UserFeedIntereaction userFeedIntereaction,
  }) {
    const boxName = AppHiveBox.likeShareCount;
    final box = Hive.box<LikeShareCount?>(boxName);
    var likeShareCount = box.get(feedId);
    if (userFeedIntereaction == UserFeedIntereaction.like) {
      likeShareCount = LikeShareCount(
        feedId: feedId,
        like: likeShareCount?.like == 1 ? 0 : 1,
        share: likeShareCount?.share,
      );
    } else if (userFeedIntereaction == UserFeedIntereaction.share) {
      likeShareCount = LikeShareCount(
        feedId: feedId,
        like: likeShareCount?.like,
        share: likeShareCount?.share == 1 ? 0 : 1,
      );
    }
    box.put(feedId, likeShareCount);
    return likeShareCount;
  }
}
