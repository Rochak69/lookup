import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/video_page/presentation/bloc/video_feed_bloc.dart';
import 'package:lookup/features/video_page/presentation/bloc/video_feed_state.dart';
import 'package:lookup/res/colors.dart';

class FeedID extends StatelessWidget {
  const FeedID({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoFeedBloc, VideoFeedState>(
      buildWhen: (previous, current) =>
          previous.likeShareCount?.feedId != current.likeShareCount?.feedId,
      builder: (context, state) {
        return Text(
          state.theStates == TheStates.sucess
              ? 'Feed ID - ${state.likeShareCount?.feedId}'
              : '...',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w900,
          ),
        );
      },
    );
  }
}
