import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/res/colors.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 32.w),
      height: 28.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: TextField(
        style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.textfieldHintGrey,
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 6.h),
          hintText: 'Search and lookup your favorites ',
        ),
      ),
    );
  }
}
