import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/features/homepage/data/all_feeds_data.dart';
import 'package:lookup/features/video_page/enum/user_feed_intereaction.dart';
import 'package:lookup/features/video_page/presentation/bloc/video_feed_bloc.dart';
import 'package:lookup/features/video_page/presentation/bloc/video_feed_state.dart';
import 'package:lookup/features/video_page/presentation/widgets/feed_interaction.dart';
import 'package:lookup/res/app_images.dart';
import 'package:lookup/res/colors.dart';
import 'package:lookup/utils/ui_helper.dart';

class FeedInteractionButtons extends StatelessWidget {
  const FeedInteractionButtons({required this.feed, super.key});
  final FeedData feed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: BlocConsumer<VideoFeedBloc, VideoFeedState>(
        listener: (context, state) => UiHelper.showSnackbar(
          context,
          message: state.errorMessage,
        ),
        listenWhen: (previous, current) => current.theStates == TheStates.error,
        buildWhen: (previous, current) =>
            previous.theStates != current.theStates ||
            previous.likeShareCount != current.likeShareCount,
        builder: (context, state) {
          return Column(
            children: [
              FeedInteraction(
                imagewidth: 44.w,
                count: state.theStates == TheStates.sucess
                    ? '${state.likeShareCount?.like ?? 0}'
                    : '..',
                image: AppImages.like,
                imageColor: state.likeShareCount?.like == 1 &&
                        state.theStates == TheStates.sucess
                    ? AppColors.error
                    : AppColors.white,
                onTap: () => BlocProvider.of<VideoFeedBloc>(context).add(
                  LikeShareEvent(
                    feed: feed,
                    userFeedIntereaction: UserFeedIntereaction.like,
                  ),
                ),
              ),
              VerticalSpacing(24.h),
              FeedInteraction(
                imagewidth: 34.w,
                count: '95.6k',
                image: AppImages.comment,
              ),
              VerticalSpacing(40.h),
              FeedInteraction(
                imagewidth: 34.w,
                count: state.theStates == TheStates.sucess
                    ? '${state.likeShareCount?.share ?? 0}'
                    : '..',
                image: AppImages.share,
                onTap: () => BlocProvider.of<VideoFeedBloc>(context).add(
                  LikeShareEvent(
                    feed: feed,
                    userFeedIntereaction: UserFeedIntereaction.share,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
