import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/core/route/app_router.gr.dart';
import 'package:lookup/features/common/widgets/horizontal_spacing.dart';
import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/features/homepage/data/all_feeds_model.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({required this.feed, super.key});
  final AllFeeds feed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          feed.feedTitle,
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w800),
        ),
        VerticalSpacing(7.h),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            itemCount: feed.data?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                if (feed.data?[index] != null) {
                  AutoRouter.of(context)
                      .push(VideoRoute(feed: feed.data![index]));
                }
              },
              child: Image.asset(
                feed.data?[index].image ?? '',
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
