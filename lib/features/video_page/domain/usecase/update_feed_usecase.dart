import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/features/video_page/domain/entity/feed_video_entity.dart';
import 'package:lookup/features/video_page/domain/repository/feed_video_repository.dart';
import 'package:lookup/features/video_page/enum/user_feed_intereaction.dart';

class UpdateFeedDetailsParam {
  UpdateFeedDetailsParam({
    required this.id,
    required this.userFeedIntereaction,
  });

  final int id;
  final UserFeedIntereaction userFeedIntereaction;
}

@lazySingleton
class UpdateFeedDetailsUsecase
    extends SynchronousUseCase<FeedVideoEntity?, UpdateFeedDetailsParam> {
  UpdateFeedDetailsUsecase(this.repository);

  final FeedVideoRepository repository;
  @override
  Either<AppError, FeedVideoEntity?> call(UpdateFeedDetailsParam param) {
    return repository.updateFeedDetails(
      feedId: param.id,
      userFeedIntereaction: param.userFeedIntereaction,
    );
  }
}
