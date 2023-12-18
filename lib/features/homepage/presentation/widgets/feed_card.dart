import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Image.asset(
              feed.homeFeeds[index].image,
              width: 90.w,
              fit: BoxFit.fitHeight,
            ),
            separatorBuilder: (context, index) => HorizontalSpacing(4.w),
          ),
        ),
      ],
    );
  }
}
