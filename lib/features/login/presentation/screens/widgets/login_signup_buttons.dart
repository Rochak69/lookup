import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/common/widgets/app_button.dart';
import 'package:lookup/features/common/widgets/horizontal_spacing.dart';
import 'package:lookup/res/colors.dart';

class LoginSignUpButtons extends StatelessWidget {
  const LoginSignUpButtons({super.key, this.onLogin, this.onSignUp});
  final void Function()? onLogin;
  final void Function()? onSignUp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AppButton.white(
              onTap: onSignUp,
              text: 'SIGNUP',
              textStyle: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          HorizontalSpacing(10.w),
          Expanded(
            child: AppButton.blue(
              onTap: onLogin,
              text: 'LOGIN',
              textStyle: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
