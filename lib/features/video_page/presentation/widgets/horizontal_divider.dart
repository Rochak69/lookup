import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/res/index.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    super.key,
    this.height = 10,
    this.color = AppColors.white,
    this.width = 2,
    this.padding,
  });
  final double height;
  final double width;
  final Color color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        height: height,
        width: width,
        color: color,
      ),
    );
  }
}
