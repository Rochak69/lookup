import 'package:dartz/dartz.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/features/video_page/data/model/feed_video_model.dart';
import 'package:lookup/features/video_page/enum/user_feed_intereaction.dart';

abstract class FeedVideoRepository {
  Either<AppError, FeedVideoModel?> getFeedDetails({required int feedId});
  Either<AppError, FeedVideoModel?> updateFeedDetails({
    required int feedId,
    required UserFeedIntereaction userFeedIntereaction,
  });
}
