import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/hive/app_hive_box.dart';
import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/homepage/data/feed_list.dart';
import 'package:lookup/features/video_page/enum/user_feed_intereaction.dart';
import 'package:lookup/features/video_page/presentation/bloc/video_feed_state.dart';

part 'video_feed_event.dart';

@injectable
class VideoFeedBloc extends Bloc<VideoFeedEvent, VideoFeedState> {
  VideoFeedBloc() : super(const VideoFeedState()) {
    on<LikeShareEvent>(_handleLikeUnlike);
    on<GetFeedDetails>(_getFeedDetails);
  }

  FutureOr<void> _handleLikeUnlike(
    LikeShareEvent event,
    Emitter<VideoFeedState> emit,
  ) {
    try {
      emit(state.copyWith(theStates: TheStates.initial));
      const boxName = AppHiveBox.likeShareCount;
      final box = Hive.box<LikeShareCount?>(boxName);
      var likeShareCount = box.get(event.feed.id);
      if (event.userFeedIntereaction == UserFeedIntereaction.like) {
        likeShareCount = LikeShareCount(
          feedId: event.feed.id,
          like: likeShareCount?.like == 1 ? 0 : 1,
          share: likeShareCount?.share,
        );
      } else if (event.userFeedIntereaction == UserFeedIntereaction.share) {
        likeShareCount = LikeShareCount(
          feedId: event.feed.id,
          like: likeShareCount?.like,
          share: likeShareCount?.share == 1 ? 0 : 1,
        );
      }

      box.put(event.feed.id, likeShareCount);

      emit(
        state.copyWith(
          theStates: TheStates.sucess,
          likeShareCount: likeShareCount,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          theStates: TheStates.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _getFeedDetails(
    GetFeedDetails event,
    Emitter<VideoFeedState> emit,
  ) {
    try {
      emit(state.copyWith(theStates: TheStates.initial));
      const boxName = AppHiveBox.likeShareCount;
      final box = Hive.box<LikeShareCount?>(boxName);
      var likeShareCount = box.get(event.feedId);
      emit(
        state.copyWith(
          theStates: TheStates.sucess,
          likeShareCount: likeShareCount,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          theStates: TheStates.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
