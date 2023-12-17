import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/common/widgets/shadowed_container.dart';

class SelectableInterest extends StatelessWidget {
  const SelectableInterest({required this.interest, super.key, this.onTap});
  final String interest;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ShadowedContainer(
        borderRadius: BorderRadius.circular(10.r),
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
        child: Text(
          interest,
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
