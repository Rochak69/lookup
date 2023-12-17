import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lookup/res/index.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    required this.color,
    super.key,
    this.onTap,
    this.textStyle,
  });
  const AppButton.white({
    required this.text,
    super.key,
    this.color = AppColors.white,
    this.onTap,
    this.textStyle,
  });
  const AppButton.blue({
    required this.text,
    super.key,
    this.color = AppColors.primary,
    this.onTap,
    this.textStyle,
  });
  final String text;
  final Color color;
  final TextStyle? textStyle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: AppColors.buttonShadow,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
          color: color,
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 40.w),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
