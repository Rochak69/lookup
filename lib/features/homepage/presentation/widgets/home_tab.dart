import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/res/colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    required this.text,
    required this.icon,
    super.key,
  });
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          icon,
          height: 24.h,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.homeTextGrey,
          ),
        ),
      ],
    );
  }
}
