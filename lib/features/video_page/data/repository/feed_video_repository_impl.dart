import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/features/video_page/data/model/feed_video_model.dart';
import 'package:lookup/features/video_page/data/source/feed_video_local_source.dart';

import 'package:lookup/features/video_page/domain/repository/feed_video_repository.dart';
import 'package:lookup/features/video_page/enum/user_feed_intereaction.dart';
import 'package:lookup/res/index.dart';

@LazySingleton(as: FeedVideoRepository)
class FeedVideoRepositoryImpl extends FeedVideoRepository {
  FeedVideoRepositoryImpl(this.localSource);

  final FeedVideoLocalSource localSource;

  @override
  Either<AppError, FeedVideoModel?> getFeedDetails({required int feedId}) {
    try {
      return right(localSource.getFeedDetails(feedId: feedId));
    } catch (e) {
      return left(InternalAppError(errorMessage: AppConstants.errorMessage));
    }
  }

  @override
  Either<AppError, FeedVideoModel?> updateFeedDetails({
    required int feedId,
    required UserFeedIntereaction userFeedIntereaction,
  }) {
    try {
      return right(
        localSource.updateFeedDetails(
          feedId: feedId,
          userFeedIntereaction: userFeedIntereaction,
        ),
      );
    } catch (e) {
      return left(InternalAppError(errorMessage: AppConstants.errorMessage));
    }
  }
}
