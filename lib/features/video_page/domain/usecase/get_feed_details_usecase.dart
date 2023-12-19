import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/features/video_page/data/model/feed_video_model.dart';
import 'package:lookup/features/video_page/domain/repository/feed_video_repository.dart';

class GetFeedDetailsParam {
  GetFeedDetailsParam({required this.id});

  final int id;
}

@lazySingleton
class GetFeedDetailsUsecase
    extends SynchronousUseCase<FeedVideoModel?, GetFeedDetailsParam> {
  GetFeedDetailsUsecase(this.repository);

  final FeedVideoRepository repository;
  @override
  Either<AppError, FeedVideoModel?> call(GetFeedDetailsParam param) {
    return repository.getFeedDetails(feedId: param.id);
  }
}
