import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/common/widgets/horizontal_spacing.dart';

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
            elevation: 8,
            child: Icon(
              Icons.mail,
              size: 28.sp,
            ),
          ),
        ),
        HorizontalSpacing(16.w),
        Card(
          elevation: 8,
          child: Icon(
            Icons.mail,
            size: 28.sp,
          ),
        ),
        HorizontalSpacing(16.w),
        Card(
          elevation: 8,
          child: Icon(
            Icons.mail,
            size: 28.sp,
          ),
        ),
      ],
    );
  }
}
