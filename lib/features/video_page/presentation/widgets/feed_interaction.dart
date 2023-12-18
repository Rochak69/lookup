// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/res/colors.dart';

class FeedInteraction extends StatelessWidget {
  const FeedInteraction({
    required this.imagewidth,
    required this.count,
    required this.image,
    super.key,
    this.onTap,
    this.imageColor,
  });
  final double imagewidth;
  final String count;
  final String image;
  final Color? imageColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Image.asset(
            image,
            width: imagewidth,
            color: imageColor,
          ),
        ),
        VerticalSpacing(4.h),
        Text(
          count,
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
