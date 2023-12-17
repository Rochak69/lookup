import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/res/app_images.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      color: Colors.black.withOpacity(0.8),
      padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 17.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppImages.home),
          Image.asset(AppImages.search),
          Image.asset(AppImages.newPost),
          Image.asset(AppImages.messages),
          Image.asset(AppImages.profile),
        ],
      ),
    );
  }
}
