import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/common/widgets/app_scaffold.dart';
import 'package:lookup/features/common/widgets/shadowed_container.dart';
import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/features/homepage/data/feed_list.dart';
import 'package:lookup/features/homepage/presentation/widgets/app_bottom_navigation.dart';
import 'package:lookup/features/homepage/presentation/widgets/feed_card.dart';
import 'package:lookup/features/homepage/presentation/widgets/home_app_bar.dart';
import 'package:lookup/features/homepage/presentation/widgets/home_search_field.dart';
import 'package:lookup/features/homepage/presentation/widgets/home_tab.dart';
import 'package:lookup/res/index.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _getGradient(),
      child: AppScaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        appBar: const HomeAppBar(),
        body: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Column(
            children: [
              const HomeSearchField(),
              VerticalSpacing(8.h),
              ShadowedContainer(
                height: 60.h,
                borderRadius: BorderRadius.circular(5.r),
                margin: EdgeInsets.only(right: 32.w),
                padding: EdgeInsets.fromLTRB(11.w, 11.h, 11.w, 2.h),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeTab(text: 'Trending', icon: AppImages.trending),
                    HomeTab(text: 'Popular', icon: AppImages.popular),
                    HomeTab(text: 'Latest', icon: AppImages.latest),
                    HomeTab(text: 'Following', icon: AppImages.following),
                  ],
                ),
              ),
              VerticalSpacing(23.h),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 100.h),
                  itemCount: feedList.length,
                  itemBuilder: (context, index) => FeedCard(
                    title: feedList[index],
                    image: feedImages[index],
                  ),
                  separatorBuilder: (context, index) => VerticalSpacing(18.h),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(),
      ),
    );
  }

  BoxDecoration _getGradient() {
    const Color background = AppColors.primary;
    const fill = AppColors.white;
    final gradient = <Color>[
      background,
      background,
      fill,
      fill,
    ];
    const fillPercent = 80;
    const fillStop = (100 - fillPercent) / 100;
    final stops = <double>[0, fillStop, fillStop, 1];
    return BoxDecoration(
      gradient: LinearGradient(
        colors: gradient,
        stops: stops,
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
      ),
    );
  }
}
