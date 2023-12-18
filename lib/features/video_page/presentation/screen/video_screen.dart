import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/app/bloc/app_profile_bloc.dart';
import 'package:lookup/features/common/widgets/app_scaffold.dart';
import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/features/homepage/data/feed_list.dart';
import 'package:lookup/features/homepage/presentation/widgets/app_bottom_navigation.dart';
import 'package:lookup/features/video_page/enum/user_feed_intereaction.dart';
import 'package:lookup/features/video_page/presentation/bloc/video_feed_bloc.dart';
import 'package:lookup/features/video_page/presentation/bloc/video_feed_state.dart';
import 'package:lookup/features/video_page/presentation/widgets/feed_interaction.dart';
import 'package:lookup/features/video_page/presentation/widgets/horizontal_divider.dart';
import 'package:lookup/res/index.dart';
import 'package:lookup/utils/ui_helper.dart';

@RoutePage()
class VideoScreen extends StatefulWidget {
  const VideoScreen({required this.feed, super.key});
  final FeedModel feed;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<VideoFeedBloc>(context)
        .add(GetFeedDetails(feedId: widget.feed.id));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.feed.image),
          fit: BoxFit.cover,
        ),
      ),
      child: AppScaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(22.w, 50.h, 22.w, 26.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Following',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  HorizontalDivider(
                    height: 33.h,
                    width: 1.w,
                  ),
                  Text(
                    'For You',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: BlocConsumer<VideoFeedBloc, VideoFeedState>(
                  listener: (context, state) => UiHelper.showSnackbar(
                    context,
                    message: state.errorMessage,
                  ),
                  listenWhen: (previous, current) =>
                      current.theStates == TheStates.error,
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
                          onTap: () =>
                              BlocProvider.of<VideoFeedBloc>(context).add(
                            LikeShareEvent(
                              feed: widget.feed,
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
                          onTap: () =>
                              BlocProvider.of<VideoFeedBloc>(context).add(
                            LikeShareEvent(
                              feed: widget.feed,
                              userFeedIntereaction: UserFeedIntereaction.share,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: BlocBuilder<AppProfileBloc, AppProfileState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user?.email ?? '@lana_love123',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          "What's your favorite song ?",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(),
      ),
    );
  }
}
