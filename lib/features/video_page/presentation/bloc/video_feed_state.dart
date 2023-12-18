import 'package:equatable/equatable.dart';
import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/homepage/data/feed_list.dart';
import 'package:lookup/res/app_constants.dart';

class VideoFeedState extends Equatable {
  const VideoFeedState({
    this.theStates = TheStates.initial,
    this.errorMessage,
    this.likeShareCount,
  });

  final TheStates theStates;
  final String? errorMessage;

  final LikeShareCount? likeShareCount;

  VideoFeedState copyWith({
    TheStates? theStates,
    String errorMessage = AppConstants.errorMessage,
    LikeShareCount? likeShareCount,
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
