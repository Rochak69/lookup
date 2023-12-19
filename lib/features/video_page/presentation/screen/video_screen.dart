import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/common/widgets/app_scaffold.dart';
import 'package:lookup/features/homepage/data/all_feeds_data.dart';
import 'package:lookup/features/homepage/presentation/widgets/app_bottom_navigation.dart';
import 'package:lookup/features/video_page/presentation/bloc/video_feed_bloc.dart';
import 'package:lookup/features/video_page/presentation/widgets/feed_caption.dart';
import 'package:lookup/features/video_page/presentation/widgets/feed_id.dart';
import 'package:lookup/features/video_page/presentation/widgets/feed_interaction_buttons.dart';
import 'package:lookup/features/video_page/presentation/widgets/following_for_you_tabs.dart';

@RoutePage()
class VideoScreen extends StatefulWidget {
  const VideoScreen({required this.feed, super.key});
  final FeedData feed;

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
              const FollowingForYouTabs(),
              const Spacer(),
              const FeedID(),
              FeedInteractionButtons(feed: widget.feed),
              FeedCaption(
                feedModel: widget.feed,
              ),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(),
      ),
    );
  }
}
