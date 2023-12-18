import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/common/widgets/horizontal_spacing.dart';
import 'package:lookup/res/index.dart';

class SocialLogins extends StatelessWidget {
  const SocialLogins({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Card(
            color: AppColors.white,
            surfaceTintColor: AppColors.white,
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
              child: Image.asset(
                AppImages.gmail,
                width: 28.w,
                height: 20.h,
              ),
            ),
          ),
        ),
        HorizontalSpacing(16.w),
        Card(
          color: AppColors.white,
          surfaceTintColor: AppColors.white,
          elevation: 8,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
            child: Image.asset(
              AppImages.facebook,
              width: 28.w,
              height: 20.h,
            ),
          ),
        ),
        HorizontalSpacing(16.w),
        Card(
          color: AppColors.white,
          surfaceTintColor: AppColors.white,
          elevation: 8,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
            child: Image.asset(
              AppImages.xPng,
              width: 28.w,
              height: 20.h,
            ),
          ),
        ),
      ],
    );
  }
}
