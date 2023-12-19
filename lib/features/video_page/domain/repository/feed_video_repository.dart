import 'package:dartz/dartz.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/features/video_page/domain/entity/feed_video_entity.dart';
import 'package:lookup/features/video_page/enum/user_feed_intereaction.dart';

abstract class FeedVideoRepository {
  Either<AppError, FeedVideoEntity?> getFeedDetails({required int feedId});
  Either<AppError, FeedVideoEntity?> updateFeedDetails({
    required int feedId,
    required UserFeedIntereaction userFeedIntereaction,
  });
}
