part of 'video_feed_bloc.dart';

sealed class VideoFeedEvent {
  const VideoFeedEvent();
}

class LikeShareEvent extends VideoFeedEvent {
  LikeShareEvent({required this.feed, required this.userFeedIntereaction});

  final FeedModel feed;

  final UserFeedIntereaction userFeedIntereaction;
}

class GetFeedDetails extends VideoFeedEvent {
  GetFeedDetails({required this.feedId});

  final int feedId;
}
