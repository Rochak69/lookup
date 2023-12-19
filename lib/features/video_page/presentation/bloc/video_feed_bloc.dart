import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/homepage/data/all_feeds_data.dart';
import 'package:lookup/features/video_page/data/model/feed_video_model.dart';
import 'package:lookup/features/video_page/domain/usecase/get_feed_details_usecase.dart';
import 'package:lookup/features/video_page/domain/usecase/update_feed_usecase.dart';
import 'package:lookup/features/video_page/enum/user_feed_intereaction.dart';
import 'package:lookup/features/video_page/presentation/bloc/video_feed_state.dart';

part 'video_feed_event.dart';

@injectable
class VideoFeedBloc extends Bloc<VideoFeedEvent, VideoFeedState> {
  VideoFeedBloc(this.getFeedDetailsUsecase, this.updateFeedDetailsUsecase)
      : super(const VideoFeedState()) {
    on<LikeShareEvent>(_handleLikeUnlike);
    on<GetFeedDetails>(_getFeedDetails);
  }
  final GetFeedDetailsUsecase getFeedDetailsUsecase;
  final UpdateFeedDetailsUsecase updateFeedDetailsUsecase;

  FutureOr<void> _handleLikeUnlike(
    LikeShareEvent event,
    Emitter<VideoFeedState> emit,
  ) {
    emit(state.copyWith(theStates: TheStates.initial));
    updateFeedDetailsUsecase
        .call(
      UpdateFeedDetailsParam(
        id: event.feed.id,
        userFeedIntereaction: event.userFeedIntereaction,
      ),
    )
        .fold((l) {
      emit(
        state.copyWith(
          theStates: TheStates.error,
          errorMessage: l.errorMessage,
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          theStates: TheStates.sucess,
          likeShareCount: r,
        ),
      );
    });
  }

  FutureOr<void> _getFeedDetails(
    GetFeedDetails event,
    Emitter<VideoFeedState> emit,
  ) {
    emit(state.copyWith(theStates: TheStates.initial));
    getFeedDetailsUsecase.call(GetFeedDetailsParam(id: event.feedId)).fold(
      (l) {
        emit(
          state.copyWith(
            theStates: TheStates.error,
            errorMessage: l.errorMessage,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            theStates: TheStates.sucess,
            likeShareCount: r ?? FeedVideoModel(feedId: event.feedId),
          ),
        );
      },
    );
  }
}
