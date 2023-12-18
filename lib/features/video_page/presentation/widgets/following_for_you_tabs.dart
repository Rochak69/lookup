import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/video_page/presentation/widgets/horizontal_divider.dart';
import 'package:lookup/res/colors.dart';

class FollowingForYouTabs extends StatelessWidget {
  const FollowingForYouTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
