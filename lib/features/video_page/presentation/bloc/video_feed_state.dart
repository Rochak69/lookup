import 'package:equatable/equatable.dart';
import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/video_page/data/model/feed_video_model.dart';
import 'package:lookup/res/app_constants.dart';

class VideoFeedState extends Equatable {
  const VideoFeedState({
    this.theStates = TheStates.initial,
    this.errorMessage,
    this.likeShareCount,
  });

  final TheStates theStates;
  final String? errorMessage;

  final FeedVideoModel? likeShareCount;

  VideoFeedState copyWith({
    TheStates? theStates,
    String errorMessage = AppConstants.errorMessage,
    FeedVideoModel? likeShareCount,
  }) {
    return VideoFeedState(
      theStates: theStates ?? this.theStates,
      errorMessage: errorMessage,
      likeShareCount: likeShareCount ?? this.likeShareCount,
    );
  }

  @override
  List<Object?> get props => [theStates, errorMessage, likeShareCount];
}
