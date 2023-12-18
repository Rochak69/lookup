import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/core/route/app_router.gr.dart';
import 'package:lookup/features/common/widgets/horizontal_spacing.dart';
import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/features/homepage/data/feed_list.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({required this.feed, super.key});
  final HomeFeed feed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          feed.feedName,
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w800),
        ),
        VerticalSpacing(7.h),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            itemCount: feed.homeFeeds?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                if (feed.homeFeeds?[index] != null) {
                  AutoRouter.of(context)
                      .push(VideoRoute(feed: feed.homeFeeds![index]));
                }
              },
              child: Image.asset(
                feed.homeFeeds?[index].image ?? '',
                width: 90.w,
                fit: BoxFit.fitHeight,
              ),
            ),
            separatorBuilder: (context, index) => HorizontalSpacing(4.w),
          ),
        ),
      ],
    );
  }
}
