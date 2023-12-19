import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/features/video_page/domain/entity/feed_video_entity.dart';
import 'package:lookup/features/video_page/domain/repository/feed_video_repository.dart';

class GetFeedDetailsParam {
  GetFeedDetailsParam({required this.id});

  final int id;
}

@lazySingleton
class GetFeedDetailsUsecase
    extends SynchronousUseCase<LikeShareEntity?, GetFeedDetailsParam> {
  GetFeedDetailsUsecase(this.repository);

  final FeedVideoRepository repository;
  @override
  Either<AppError, LikeShareEntity?> call(GetFeedDetailsParam param) {
    return repository.getFeedDetails(feedId: param.id);
  }
}
